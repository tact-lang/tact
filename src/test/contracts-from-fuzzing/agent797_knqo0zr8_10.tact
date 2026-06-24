struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
  e: Int?;
  f: Bool?;
}

contract LotsOfNulls {
  opts: ManyOptionals;

  init() {
    self.opts = ManyOptionals{
      a:null,
      b:null,
      c:null,
      d:null,
      e:null,
      f:null,
    };
  }
}
