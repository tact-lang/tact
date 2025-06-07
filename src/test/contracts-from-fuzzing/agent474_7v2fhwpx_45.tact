struct InDef {
  a: Int;
  b: Bool = false;
}

contract OptDefault {
  data: InDef? = null;

  init() {
    self.data = null;
  }
}
