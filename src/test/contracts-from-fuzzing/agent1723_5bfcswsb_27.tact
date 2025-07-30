struct ManyBools {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
}

contract NestedBools {
  f: ManyBools;

  init() {
    self.f=ManyBools{a:true,b:false,c:true,d:false,e:true};
  }
}