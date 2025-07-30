struct Data1 {
  v: Int;
}

struct Data2 {
  v: Bool;
}

struct Data3 {
  v: String;
}

struct Combo {
  d1: Data1?;
  d2: Data2?;
  d3: Data3?;
}

contract AllOptionStruct(
  c: Combo?,
  index: Int,
  flag: Bool,
) {}
