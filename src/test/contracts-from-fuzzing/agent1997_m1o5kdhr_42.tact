contract ParamSerials(
  a: Int as uint3,
  b: Int as int8,
  c: Bool,
  d: Int as uint64,
) {
  receive() {
    let _ = self.a + self.b + self.d;
  }
}
