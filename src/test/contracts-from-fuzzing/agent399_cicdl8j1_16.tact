struct OptsInStruct {
  p: Int?;
  s: String?;
}

contract OptionalInStructFieldTest {
  si: OptsInStruct;

  init() {
    self.si = OptsInStruct{ p:null, s:null };
  }
}