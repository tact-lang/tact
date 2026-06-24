struct Mixed {
  x: Int;
  y: Bool;
  z: String;
}

contract StructInit {
  m: Mixed;
  init() {
    self.m = Mixed{ x:1, y:true, z:"abc" };
  }
}