struct S {
  a: Int;
  b: Bool?;
}

contract StructWithOptInsideOpt {
  val: S?;

  init() {
    self.val = null;
  }
}