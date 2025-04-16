struct Deep {
  s1: String;
  s2: String;
  i: Int;
}

struct Mid {
  deep: Deep;
  flag: Bool;
}

struct Top {
  mid: Mid;
  optInt: Int?;
}

contract DeeplyNestedStructTest(
  t: Top,
) {}
