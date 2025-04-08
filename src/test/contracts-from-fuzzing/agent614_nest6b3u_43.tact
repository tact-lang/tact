struct S {
  a:Int;
}
contract OrderTest {
  b: Int = 3;
  s: S;

  init() {
    self.s = S{a:4};
  }
}