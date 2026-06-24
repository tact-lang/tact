struct Flat {
  x: Int;
  y: Int;
  z: Int;
}

contract FlatStorage {
  f1: Flat;
  f2: Flat;

  init() {
    self.f1 = Flat{x:1,y:2,z:3};
    self.f2 = Flat{x:4,y:5,z:6};
  }
}