struct LongString {
  text: String;
}

contract StringFields {
  s1: LongString;
  s2: LongString;

  init(){
    self.s1 = LongString{text: "a very long string here"};
    self.s2 = LongString{text: "another long string with more more text"};
  }
}