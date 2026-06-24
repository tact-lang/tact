struct IntStrBool {
  a: Int;
  b: String;
  c: Bool;
}

contract NestedRepeated {
  s1: IntStrBool;
  s2: IntStrBool;
  s3: IntStrBool;

  init() {
    self.s1 = IntStrBool{a:1,b:"a",c:true};
    self.s2 = IntStrBool{a:2,b:"b",c:false};
    self.s3 = IntStrBool{a:3,b:"c",c:true};
  }
}
