struct Wide {
  a: Bool;
  b: Bool;
  c: Bool?;
  d: Bool?;
  e: Bool;
  f: Bool?;
  g: Bool;
  h: Bool?;
  i: Bool;
  j: Bool?;
}

contract BitWideTest {
  w: Wide;

  init() {
    self.w = Wide{
      a: true,
      b: false,
      c: null,
      d: true,
      e: false,
      f: null,
      g: true,
      h: false,
      i: true,
      j: null
    };
  }
}
