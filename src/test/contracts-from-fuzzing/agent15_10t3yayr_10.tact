struct S {
  a: Int;
  b: Int;
}

contract OptStructField {
  val: S?;

  init() {
    self.val = S{a:1,b:2};
  }
}