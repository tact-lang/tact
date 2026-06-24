struct InnerMost {
  x: Int;
  y: Bool?;
}

struct Inner {
  a: Int?;
  b: Bool;
  c: InnerMost;
}

struct Middle {
  inner: Inner;
  flag: Bool;
  optionalText: String?;
}

struct TopMost {
  m: Middle;
  description: String;
}

contract DeepParamNest(
  param: TopMost,
) {}
