struct Coordinates {
  x: Int;
  y: Int;
  z: Int;
}

contract CoordsArr {
  p1: Coordinates;
  p2: Coordinates;
  p3: Coordinates;
  p4: Coordinates;
  p5: Coordinates;
  p6: Coordinates;
  p7: Coordinates;
  p8: Coordinates;

  init() {
    self.p1=Coordinates{ x:1,y:2,z:3};
    self.p2=Coordinates{ x:4,y:5,z:6};
    self.p3=Coordinates{ x:7,y:8,z:9};
    self.p4=Coordinates{ x:10,y:11,z:12};
    self.p5=Coordinates{ x:13,y:14,z:15};
    self.p6=Coordinates{ x:16,y:17,z:18};
    self.p7=Coordinates{ x:19,y:20,z:21};
    self.p8=Coordinates{ x:22,y:23,z:24};
  }
}