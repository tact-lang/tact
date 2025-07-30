// Optional struct holding optional fields inside
struct InnerOptFields {
  x: Int?;
  y: Bool?;
}
contract OptStructOptFields {
  inner: InnerOptFields?;
  init() {
    self.inner = null;
  }
}
