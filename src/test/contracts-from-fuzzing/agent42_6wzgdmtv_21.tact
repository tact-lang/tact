struct S {
  a: Int;
  b: Int;
  c: Int;
}

contract ParamOverStruct(
  s: S,
  d: Int,
  e: Bool,
  f: String
) {
  receive() {
    let _ = self.s.a + self.d;
  }
}