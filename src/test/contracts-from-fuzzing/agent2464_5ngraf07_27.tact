struct WeirdStruct {
  a: Int?;
  b: Int;
  c: String?;
  d: Address;
  e: Bool?;
}

contract WeirdFields {
  s: WeirdStruct;
  init() {
    self.s = WeirdStruct{
      a:null,
      b:1,
      c:null,
      d:myAddress(),
      e:true
    };
  }
}