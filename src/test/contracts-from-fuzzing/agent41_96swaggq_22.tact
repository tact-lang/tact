struct StringAndBoolOpt {
  s: String?;
  b: Bool?;
}

contract StringBoolOptional {
  f: StringAndBoolOpt;

  init() {
    self.f = StringAndBoolOpt{
      s: null,
      b: null
    };
  }
}
