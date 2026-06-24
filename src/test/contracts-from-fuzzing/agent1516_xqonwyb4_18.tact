struct Mega {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: String;
  i: Bool;
  j: Int?;
}

contract ManyFields2 {
  m: Mega;

  init() {
    self.m = Mega{
      a: 1,
      b: "x",
      c: false,
      d: null,
      e: true,
      f: null,
      g: 200,
      h: "y",
      i: true,
      j: null
    };
  }
}