struct LargeNested {
  a: Int;
  b: String;
  c: Bool;
  d: Int;
  e: String;
  f: Bool;
  g: Int;
}

contract LargeStruct {
  s1: LargeNested;
  s2: LargeNested;

  init() {
    self.s1 = LargeNested{a:1,b:"b",c:true,d:4,e:"e",f:false,g:7};
    self.s2 = LargeNested{a:10,b:"bb",c:false,d:40,e:"ee",f:true,g:70};
  }
}