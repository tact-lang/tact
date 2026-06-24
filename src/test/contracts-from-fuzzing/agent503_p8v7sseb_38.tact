struct Strings {
  a: String = "";
  b: String? = null;
}

contract StringVariants {
  s: Strings;

  init() {
    self.s = Strings{};
  }
}
