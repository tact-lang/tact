struct InnerOption { val: Int? }

struct HasOptDef {
  inner: InnerOption = InnerOption{ val: null };
}

contract OptStructDefaultNull {
  f: HasOptDef;
  init() {
    self.f = HasOptDef{};
  }
}
