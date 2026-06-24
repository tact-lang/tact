struct S {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as uint32;
  d: String;
  e: Bool;
}

contract SerializeNested {
  rec: S;

  init() {
    self.rec = S{a:1,b:2,c:3,d:"hey",e:true};
  }
}