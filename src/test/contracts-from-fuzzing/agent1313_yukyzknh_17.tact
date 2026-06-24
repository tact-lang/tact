struct BigDefault {
  name: String = "abc";
  flag: Bool = true;
  count: Int = 5;
}

contract DefaultsStructFields {
  x: BigDefault;

  init() {
    self.x = BigDefault{};
  }
}