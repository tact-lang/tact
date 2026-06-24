struct BoolIntString {
  a: Bool;
  b: Int;
  c: String;
}

struct StringIntBool {
  c: String;
  b: Int;
  a: Bool;
}

contract DiffOrderStructs {
  s1: BoolIntString;
  s2: StringIntBool;
  
  init() {
    self.s1 = BoolIntString{a:true,b:1,c:"x"};
    self.s2 = StringIntBool{c:"y",b:2,a:false};
  }
}