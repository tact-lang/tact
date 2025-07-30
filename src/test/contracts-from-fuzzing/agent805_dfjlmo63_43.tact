struct SerAndDef {
  a: Int as uint16 = 40;
  b: Bool = false;
}

contract SerDefComb {
  s: SerAndDef;

  init() {
    self.s = SerAndDef{};
  }
}
