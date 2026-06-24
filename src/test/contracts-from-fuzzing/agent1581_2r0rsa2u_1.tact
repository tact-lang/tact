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
  j: Bool?;
}

contract TestContract {
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
      h: false,
      i: "world",
      j: null,
    };
  }
}