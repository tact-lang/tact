struct Inner {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct Outer {
  d: Inner?;
  e: Int;
  f: Bool;
  g: String;
}

contract DeepTest {
  bigfield: Outer = Outer{
    d: null,
    e: 12,
    f: true,
    g: "test"
  };
  init() {}
}
