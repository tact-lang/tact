struct DataA {
  x: Int;
}

struct DataB {
  y: Int;
}

contract MultiVars {
  a: DataA;
  b: DataB;

  init() {
    self.a = DataA{x:5};
    self.b = DataB{y:6};
  }
}
