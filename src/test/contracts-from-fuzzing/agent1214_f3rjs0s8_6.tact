struct BigStruct {
  f01: Int;
  f02: Bool;
  f03: String;
  f04: Int?;
  f05: Bool;
  f06: String;
  f07: Int;
  f08: Bool?;
  f09: String;
  f10: Int;
}

contract ManyStructFields {
  big: BigStruct;
  init() {
    self.big = BigStruct{
      f01: 1,
      f02: true,
      f03: "a",
      f04: null,
      f05: false,
      f06: "b",
      f07: 3,
      f08: null,
      f09: "c",
      f10: 10
    };
  }
}