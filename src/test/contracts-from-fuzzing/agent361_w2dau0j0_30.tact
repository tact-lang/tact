struct MultiOptional {
  a: Int?;
  b: String?;
  c: Cell?;
  d: Address?;
}

contract StructMultiOpt {
  m: MultiOptional;
  init() {
    self.m = MultiOptional{
      a:null,b:null,c:null,d:null
    };
  }
}
