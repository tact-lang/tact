struct All {
  a: Int;
  b: Bool?;
  c: Address?;
  d: String;
  e: Cell?;
  f: Slice;
}

contract ManyTypesOpt {
  val: All;
  init() {
    self.val = All{a:1,b:null,c:null,d:"hi",e:null,f:emptyCell().asSlice()};
  }
}