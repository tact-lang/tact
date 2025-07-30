struct MultiOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptContract {
  mo: MultiOpt;

  init() {
    self.mo = MultiOpt{
      a: null,
      b: true,
      c: null
    };
  }
}