struct TextOpt {
  s1: String?;
  s2: String?;
}

contract TextOptContract {
  d: TextOpt;

  init() {
    self.d = TextOpt{
      s1: null,
      s2: null,
    };
  }
}