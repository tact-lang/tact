struct OptDefault {
  a: Int?;
  b: Bool?;
}

contract DefaultsStruct {
  s: OptDefault = OptDefault { a: null, b: null };
}