struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool;
  f: String;
  g: Int;
  h: String;
  i: Bool;
  j: Int;
}

contract TestLargeStruct {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a: 1,
      b: true,
      c: "test",
      d: null,
      e: false,
      f: "hello",
      g: 42,
      h: "world",
      i: true,
      j: 999
    };
  }
}