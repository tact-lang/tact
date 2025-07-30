struct FlatStruct {
  a: Int;
  b: Int;
  c: Int;
}

contract TestFlat {
  s: FlatStruct;

  init() {
    self.s = FlatStruct{ a:1, b:2, c:3 };
  }
}
