struct DeepOptionals {
  s1: Int?; s2: Bool?; s3: String?; s4: Address?; s5: Cell?;
}

contract NestedDeepOptionals {
  a: DeepOptionals?;
  b: DeepOptionals?;
  c: DeepOptionals?;
  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}