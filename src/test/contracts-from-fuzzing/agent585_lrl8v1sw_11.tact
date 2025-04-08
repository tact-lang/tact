struct MixStr {
  s1: String;
  s2: String?;
}

contract Test {
  fld: MixStr = MixStr{ s1: "abc" };
  receive() {}
}