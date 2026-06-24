struct Data {
  x: Int;
}

contract ManyVars {
  a: Data;
  b: Data;
  c: Data;
  d: Data;
  e: Data;

  init() {
    self.a = Data{x:1};
    self.b = Data{x:2};
    self.c = Data{x:3};
    self.d = Data{x:4};
    self.e = Data{x:5};
  }
}
