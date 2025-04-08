struct InnerString {
  txt: String;
}

contract StringInsideStruct {
  s: InnerString;

  init() {
    self.s = InnerString{ txt: "hello" };
  }
}
