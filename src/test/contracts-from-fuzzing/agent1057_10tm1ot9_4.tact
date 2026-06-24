struct ManyFields {
  a: Int;
  b: Bool;
  c: Int;
  d: String;
  e: Bool?;
  f: Int?;
  g: String?;
  h: Int;
  i: Bool;
  j: String;
  k: Int?;
  l: Bool?;
}

contract LargeStructStorage {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: false,
      c: 2,
      d: "abc",
      e: null,
      f: 5,
      g: null,
      h: 10,
      i: true,
      j: "zzz",
      k: null,
      l: false
    };
  }
}