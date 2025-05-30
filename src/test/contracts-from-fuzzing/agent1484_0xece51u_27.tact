struct DefaultOpt {
  d: Int? = null;
}

contract OptWithDefaultField {
  s: DefaultOpt?;

  init() {
    self.s = null;
  }
}