struct InnerOpt {
 a: Int?;
 b: Bool?;
}

contract InnerOptDefaults {
  f: InnerOpt = InnerOpt{};

  init() {
    self.f = InnerOpt{a:77, b:true};
  }
}
