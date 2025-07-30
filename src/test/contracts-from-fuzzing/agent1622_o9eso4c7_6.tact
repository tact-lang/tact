struct HugeStruct {
  a: Int = 1;
  b: Bool = true;
  c: String = "";
  d: Int?;
  e: String?;
  f: Bool?;
  g: Int = 0;
  h: String = "x";
  i: Bool = false;
  j: Int?;
  k: String?;
  l: Bool?;
}

contract LotsOfFields {
  big: HugeStruct = HugeStruct{};
}