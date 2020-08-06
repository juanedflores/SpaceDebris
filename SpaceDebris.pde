import peasy.*;
PeasyCam cam;

/*
 * [ Debris ]
 */
PShape s;
ArrayList<Debris> debrisL = new ArrayList<Debris>();

/*
 * [ Stage ]
 */
boolean stage = true;
// Boundary of stage.
int boundaryW;
int boundaryH;

void setup() {
  // fullScreen(P3D);
  size(500, 500, P3D);

  // Load .obj files
  String datadir = "/Users/juaneduardoflores/Documents/Processing/Project_MASA/SpaceDebris/data";
  File[] files = new File(datadir).listFiles();
  loadObjs(files);
  println("Objs loaded: " + debrisL.size());

  // Peasy cam.
  cam = new PeasyCam(this, 400);
  cam.lookAt(width/2, height/2, 50);

  // Boundary of stage area.
  boundaryW = int(width * 0.47);
  boundaryH = int(height * 0.47);
}

void draw() {
  background(50);
  translate(width/2, height/2, 0);   
  lights();

  for (Debris d: debrisL) {
    d.show();
  }
  
  drawStage();
} 

void drawStage() {
  if(stage) {
    // Draw the bounds of what will be displayed.
    pushMatrix();
    fill(0);
    rectMode(CENTER);
    rect(0, 0, boundaryW, boundaryH);
    noFill();
    stroke(0,0,255);
    translate(0, 0, 100);
    box(boundaryW, boundaryH, 0);
    popMatrix();

    // Draw the center origin for reference.
    // stroke(0, 255, 0);
    // line(0, -100, 0, 0, 100, 0);
    // stroke(255, 0, 0);
    // line(-100, 0, 0, 100, 0, 0);
    // stroke(0, 0, 255);
    // line(0, 0, -100, 0, 0, 100);
  }
}

void keyPressed() {
    if (key == 'c') {
      stage = !stage;

      // Change appearence depending on stage value.
      if (stage) {
        // backgroundcol = color(120);
        cam.lookAt(width/2, height/2, 50);
      } else {
        // backgroundcol = color(0);
        cam.lookAt(width/2, height/2, 39);
      }
    }
}

public void loadObjs(File[] files) {
  for (File file: files) {
    if (file.isDirectory()) {
      loadObjs(file.listFiles());
    } else {
        String name = "";
        String extension = "";
        int i = file.getName().lastIndexOf('.');
        if (i > 0) {
          name = file.getName().substring(0, i);
          extension = file.getName().substring(i+1);
          if (extension.equals("obj")) {
            PShape m = loadShape(name + ".obj");
            println("loaded: " + name + ".obj");
            Debris d = new Debris(m, 0, 0);
            if (debrisL.size() < 5) {
              debrisL.add(d);
            } else {
              break;
            }
          }
        }
    }
  }
}
