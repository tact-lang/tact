struct AA {
  a: Int;
  b: Int?;
  c: Int?;
  d: Int;
}

contract OptMulti {
  f: AA;

  init() {
    self.f = AA{a:1,b:null,c:null,d:2};
  }
}