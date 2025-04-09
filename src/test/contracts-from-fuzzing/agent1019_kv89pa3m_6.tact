struct Big {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: Int?;
  j: String;
  k: Int;
  l: Bool;
}

contract BigFields {
  data: Big;

  init() {
    self.data = Big{
      a: 1, b: true, c: null, d: "d", e: null, f: null, g: 7, h: false,
      i: null, j: "j", k: 100, l: true
    };
  }
}
