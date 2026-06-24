contract BoolInts {
  b1: Bool;
  b2: Bool?;
  b3: Bool;
  b4: Bool?;
  n1: Int;
  n2: Int?;
  n3: Int;
  n4: Int?;

  init() {
    self.b1=true; self.b2=null;
    self.b3=false; self.b4=null;
    self.n1=1; self.n2=null;
    self.n3=2; self.n4=null;
  }
}