struct DeepOptional {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

contract OptFields {
  data: DeepOptional;

  init() {
    self.data = DeepOptional{a:null,b:null,c:null,d:null,e:null,f:null};
  }
}