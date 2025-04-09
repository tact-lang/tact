struct SOptDef {
  a: Int? = null;
  b: String? = null;
}

contract OptDefaultsStruct {
  s: SOptDef;

  init() {
    self.s = SOptDef{};
  }
}