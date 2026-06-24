struct Defaults {
  a: Int = 1;
  b: Int?;
  c: String = "string";
  d: Bool?;
}

contract WithDefaults {
  f: Defaults = Defaults{};
}