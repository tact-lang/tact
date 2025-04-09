struct BigStruct {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
  g: Int;
  h: Bool;
}

contract TestContract {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      a: 1,
      b: true,
      c: null,
      d: false,
      e: "hello",
      f: null,
      g: 42,
      h: true
    };
  }
}