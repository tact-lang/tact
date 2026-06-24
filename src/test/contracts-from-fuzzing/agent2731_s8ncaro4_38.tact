struct SInner {
  val: Int;
}

struct SOuter {
  s: SInner;
}

contract DeepDefaultsImplicit {
  field: SOuter = SOuter{s: SInner{val:42}};

  init() {
    self.field = SOuter{s: SInner{val:43}};
  }
}