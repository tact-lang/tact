struct StringFields {
 a: String;
 b: String;
 c: String;
 d: String;
}

contract ManyStrings {
  s: StringFields;

  init() {
    self.s = StringFields{a:"a",b:"b",c:"c",d:"d"};
  }
}