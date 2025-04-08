struct BigStruct {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: Int;
  g: Bool;
  h: String;
  i: Int?;
  j: Bool;
  k: String;
  l: Int;
}

contract TestContract {
  big: BigStruct;
  init() {
    self.big = BigStruct{
      a: 1,
      b: true,
      c: null,
      d: false,
      e: "hi",
      f: 2,
      g: true,
      h: "world",
      i: 42,
      j: false,
      k: "again",
      l: 999
    };
  }
}