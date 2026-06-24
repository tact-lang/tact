struct S {
  a: Int;
}

contract Setter {
  val: S;

  init() {
    self.val = S{a:0};
  }

  receive() {
    self.val = S{a:self.val.a + 1};
  }
}