struct Deep {
  a: Int? = 1;
  b: Bool = false;
}

contract OptWithDefaults {
  st: Deep;

  init() {
    self.st = Deep{};
  }
}
