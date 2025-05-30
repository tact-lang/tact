contract ParamMix(
  a: Int,
  b: String,
  c: Bool,
  d: Int?,
  e: String?,
  f: Bool?
) {
  receive() {
    let _ = self.a + 1;
  }
}