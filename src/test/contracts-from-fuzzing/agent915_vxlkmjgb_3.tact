struct LargeStruct {
  a: Int;
  b: Bool;
  c: Int as uint4;
  d: Int?;
  e: String;
  f: Bool;
  g: Int as int16;
  h: Int?;
  i: String;
  j: Bool;
  k: Int;
  l: Int?;
}

contract ManyFields {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a: 1, b: true, c: 7, d: null, e: "abc", f: false,
      g: -1000, h: 123, i: "def", j: true, k: 42, l: null
    };
  }
}
