struct LotsOpts {
  oi1: Int?;
  oi2: Int?;
  os1: String?;
  os2: String?;
  ob1: Bool?;
  ob2: Bool?;
}

contract LotsOptionals {
  f: LotsOpts;

  init() {
    self.f = LotsOpts{
      oi1: 1,
      oi2: null,
      os1: "abc",
      os2: null,
      ob1: true,
      ob2: null,
    };
  }
}