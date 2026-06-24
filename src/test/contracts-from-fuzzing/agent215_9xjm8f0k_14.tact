struct Defaults {
  a: Int = 10;
  b: Bool = false;
  c: String = "hi";
}

contract DefaultFields {
  d: Defaults = Defaults{};
}