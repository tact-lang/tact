struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Bool?;
  e: String?;
  f: Address?;
  g: Cell?;
  h: Slice?;
}

contract Test {
  m: ManyOptionals;
  init() {
    self.m = ManyOptionals{
      a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
    };
  }
}