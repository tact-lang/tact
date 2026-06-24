struct Params {
  vals: map<Int, Int>;
}

contract Test {
  p: Params;

  init() {
    self.p = Params{ vals: emptyMap() };
  }
}