struct ManyOptionalsStruct {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
  h: Int?;
}

contract ManyOptStruct {
  data: ManyOptionalsStruct;

  init() {
    self.data = ManyOptionalsStruct{
      a: null, b: 2, c: null, d: 4, e: null, f: 6, g: null, h: 8
    };
  }
}