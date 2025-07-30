struct IntOnly {
  a: Int;
  b: Int;
  c: Int;
}

contract ContractIntOnly {
  ints: IntOnly;

  init() {
    self.ints = IntOnly{a:4,b:5,c:6};
  }
}