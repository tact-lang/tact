struct InnerSerDef {
  x: Int as uint32 = 13;
}

contract NestedSerDef {
  s: InnerSerDef;

  init() {
    self.s = InnerSerDef{};
  }
}
