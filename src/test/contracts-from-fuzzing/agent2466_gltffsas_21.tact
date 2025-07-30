struct MultiDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Bool = false;
  e: Bool? = null;
  f: String = "x";
  g: String? = null;
}

contract DefaultStruct {
  s: MultiDefaults = MultiDefaults{};
  init() {}
}