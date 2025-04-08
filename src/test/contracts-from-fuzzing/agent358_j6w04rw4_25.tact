struct OnlyOptions {
  i: Int?;
  b: Bool?;
  s: String?;
}

contract OnlyOptState {
  data: OnlyOptions;
  init() {
    self.data = OnlyOptions{
      i: null,
      b: null,
      s: null
    };
  }
}