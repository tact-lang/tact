struct ManyBools {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
}

contract ManyBoolsTest {
  flags: ManyBools;

  init() {
    self.flags = ManyBools{a:true,b:false,c:true,d:false,e:true};
  }
}
