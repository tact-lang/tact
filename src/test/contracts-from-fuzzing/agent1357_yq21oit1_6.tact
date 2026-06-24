struct AllDefaults {
  a: Int = 1;
  b: Bool? = null;
  s: String = "x";
}

contract DefaultsCascade {
  data: AllDefaults = AllDefaults{};
}