struct WithDefaultOptional {
  a: Int? = null;
  b: String? = "a";
}

contract DefaultOptMix {
  f: WithDefaultOptional;

  init() {
    self.f = WithDefaultOptional{};
  }
}