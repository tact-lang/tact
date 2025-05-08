struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
  k: Bool?;
  l: String;
}

contract Variants {
  store: LargeStruct;

  init() {
    self.store = LargeStruct{
      a: 1,
      b: true,
      c: "c",
      d: null,
      e: null,
      f: "f",
      g: 7,
      h: false,
      i: "i",
      j: 10,
      k: true,
      l: "last"
    };
  }
}