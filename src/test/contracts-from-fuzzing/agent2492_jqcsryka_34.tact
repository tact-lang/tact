struct OptWrap {
  o: Int?;
}

contract NestedOptStruct {
  s: OptWrap;

  init() {
    self.s = OptWrap{o: null};
  }
}