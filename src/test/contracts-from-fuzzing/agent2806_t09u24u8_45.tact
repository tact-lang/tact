struct InitOptional {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptsSetNull {
  state: InitOptional;

  init() {
    self.state = InitOptional{
      a: null,
      b: null,
      c: null
    };
  }
}