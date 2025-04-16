struct Triple {
  x: Int;
  y: Bool;
  z: Int?;
}

contract WithTriple {
  f: Triple;

  init() {
    self.f = Triple{ x:1, y:true, z:null };
  }
}