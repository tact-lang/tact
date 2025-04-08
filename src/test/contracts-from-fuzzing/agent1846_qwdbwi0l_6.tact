struct ManyTypes {
  a: Int = 1;
  b: Int as uint32 = 2;
  c: Bool = true;
  d: String = "hello";
  e: Bool?;
  f: Int?;
}

contract ManyTypesStorage {
  s: ManyTypes = ManyTypes{};
}