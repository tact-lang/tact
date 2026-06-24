struct InnerOpt {
  a: Int?;
  b: Bool?;
}

contract OptFields {
  data: InnerOpt;

  init() {
    self.data = InnerOpt{a: null, b: true};
  }
}