struct LongStringStruct {
  a: String;
  b: String;
  c: String;
  d: String;
  e: String;
}

contract StringHolder {
  data: LongStringStruct;
  init() {
    self.data = LongStringStruct{
      a: "A",
      b: "B",
      c: "C",
      d: "D",
      e: "E"
    };
  }
}