struct S {
  a: Int as int8;
  b: Int as uint4;
}

contract SerializeV {
  val: S;

  init() {
    self.val = S { a: -5, b: 8 };
  }
}
