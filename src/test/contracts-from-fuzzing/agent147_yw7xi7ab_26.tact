struct Optionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
}

contract Opts {
  f: Optionals;
  init() {
    self.f = Optionals{a:null,b:null,c:null,d:null,e:null,f:null};
  }
}