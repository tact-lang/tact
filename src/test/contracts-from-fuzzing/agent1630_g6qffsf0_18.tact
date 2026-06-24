struct A {
  n: Int;
  s: String;
  b: Bool;
}

contract InitAllTypes {
  val: A;

  init() {
    self.val = A{ n: 9, s: "hello", b: true };
  }
}