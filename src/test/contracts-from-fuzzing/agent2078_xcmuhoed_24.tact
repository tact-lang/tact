struct OptInt {
  x: Int?;
}

struct StrWrap {
  s: String = "foo";
}

contract Combo {
  opt: OptInt = OptInt{ x: null };
  str: StrWrap = StrWrap{ s: "bar" };
  init() {}
}