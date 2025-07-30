struct DeepMany {
  a: Int;
  b: Bool;
  c: String;
  d: String;
  e: String;
  f: Int;
  g: Bool;
  h: Int;
  i: Bool;
  j: String;
  k: String;
  l: Int;
  m: Bool;
}

contract WideStructTest {
  deep: DeepMany;

  init() {
    self.deep = DeepMany{
      a: 1, b: false, c: "x", d: "y", e: "z",
      f: 2, g: true, h: 3, i: false, j: "p",
      k: "q", l: 4, m: true
    };
  }
}