struct LongOptionalNest {
  a: Int?;
  b: Int?;
  c: Mid?
}

struct Mid {
  d: Int?;
  e: Inner?
}

struct Inner {
  f: Int?;
}

contract DeepLongOptionals {
  data: LongOptionalNest = LongOptionalNest{a:null,b:null,c:null};

  init() {
    self.data = LongOptionalNest{a:null,b:null,c:Mid{d:null,e:Inner{f:null}}};
  }
}