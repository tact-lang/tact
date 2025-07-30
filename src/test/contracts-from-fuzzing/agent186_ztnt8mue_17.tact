// Using contract parameter syntax with many primitive types
contract TestContract(
  a: Int,
  b: Int as uint32,
  c: Bool,
  d: Bool,
  e: String,
  f: Int?,
  g: Bool?,
  h: String?
) {
  receive() {
    // just dummy reference
    let _ = self.a + self.b;
  }
}