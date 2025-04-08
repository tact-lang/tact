struct LargeStruct {
  a: Int;
  b: Int;
  c: Int;
  d: String;
  e: Bool;
  f: Int;
  g: Bool;
  h: String;
  i: Int?;
  j: String?;
}

contract BigStructField {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a: 1,
      b: 2,
      c: 3,
      d: "d",
      e: true,
      f: 4,
      g: false,
      h: "h",
      i: null,
      j: null,
    };
  }
}