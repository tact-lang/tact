struct InnerS {
  x: Int?;
}

contract DeepNulls {
  inr: InnerS? = null;

  init() {
    self.inr = null;
  }
}