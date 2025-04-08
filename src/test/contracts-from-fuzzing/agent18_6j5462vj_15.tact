struct S {
  a: Int;
  b: Int;
}

contract Defaults {
  val: S = S{ a: 10, b: 20 };

  init() {
    self.val = S{ a:1, b:2 };
  }
}