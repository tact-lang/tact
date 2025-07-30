struct MultiOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Slice?;
  e: Cell?;
  f: Builder?;
  g: String?;
}

contract AllOpts {
  many: MultiOpt;

  init() {
    self.many = MultiOpt{
      a:null, b:null, c:null, d:null, e:null, f:null, g:null
    };
  }
}