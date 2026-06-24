struct OptionalNested {
  val: Int?;
}

contract LargeOptionalChain {
  a: OptionalNested?;
  b: OptionalNested?;
  c: OptionalNested?;
  d: OptionalNested?;
  e: OptionalNested?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
  }
}