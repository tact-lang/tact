struct BothOpts {
  oi: Int?;
  ob: Bool?;
}

contract OptionalMulti {
  data: BothOpts;

  init() {
    self.data = BothOpts{
      oi: null,
      ob: true,
    };
  }
}