struct Mixed {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
}

contract MixedOpt {
  field: Mixed;

  init() {
    self.field = Mixed{ a:1, b:null, c:2, d:null };
  }
}