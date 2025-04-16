struct Both {
  foo: Int;
  bar: Bool?;
}

contract MultiAssign {
  a: Both;

  init() {
    self.a = Both{ foo:1, bar:null };
  }
}