struct InnerS {
  val: Int;
}

contract NestedOptsInitialized {
  s: InnerS?;

  init() {
    self.s = null;
  }
}