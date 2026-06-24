struct Big {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
  i: Int;
  j: Bool;
  k: Int?;
  l: Bool?;
  m: Int;
  n: Bool;
  o: Int?;
  p: Bool?;
}

contract TestContract {
  x: Big;

  init() {
    self.x = Big{
      a: 1, b: false, c: null, d: null,
      e: 5, f: true, g: 7, h: null,
      i: 9, j: false, k: 11, l: null,
      m: 15, n: true, o: 17, p: false,
    };
  }
}