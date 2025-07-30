struct LongStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Int;
  k: Bool;
  l: String;
}

contract LongStructStorage {
  myData: LongStruct;

  init() {
    self.myData = LongStruct{
      a: 1,
      b: true,
      c: "hi",
      d: null,
      e: false,
      f: "opt",
      g: 2,
      h: false,
      i: "world",
      j: 3,
      k: true,
      l: "!"
    };
  }
}