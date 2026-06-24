struct LargeNested {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Bool?;
}

contract DeepLarge {
  d1: LargeNested;
  d2: LargeNested;

  init() {
    self.d1 = LargeNested{ a:1, b:"b", c:true, d:null, e:null, f:null };
    self.d2 = LargeNested{ a:2, b:"bb", c:false, d:null, e:null, f:null };
  }
}
