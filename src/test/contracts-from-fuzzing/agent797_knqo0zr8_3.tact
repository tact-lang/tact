struct WideStruct {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
}

contract WideFields {
  data: WideStruct;

  init() {
    self.data = WideStruct{
      a: 1,
      b: true,
      c: null,
      d: false,
      e: 2,
      f: true,
      g: 3,
      h: null,
    };
  }
}
