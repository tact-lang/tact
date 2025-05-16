struct DefaultOpt {
  a: Int = 10;
  b: Int?;
}

contract NullDefaultOpt {
  x: DefaultOpt;

  init() {
    self.x = DefaultOpt{ a: 20, b: null };
  }
}