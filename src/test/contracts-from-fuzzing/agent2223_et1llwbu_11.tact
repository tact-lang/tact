struct OptionalAndDefaults {
  int1: Int = 1;
  int2: Int?; // default null
  int3: Int? = null;
  b1: Bool = false;
  b2: Bool?; // default null
  str1: String = "str";
  str2: String?;
}

contract OptionalDefaults {
  data: OptionalAndDefaults = OptionalAndDefaults{};
}