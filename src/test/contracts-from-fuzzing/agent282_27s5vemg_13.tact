struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Address?;
  e: Cell?;
  f: String?;
  g: Slice?;
  h: Builder?;
}

contract ManyOptFields {
  m: ManyOptionals;
  init() {
    self.m = ManyOptionals{
      a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
    };
  }
}