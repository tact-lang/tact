struct InnerStruct {
  a: Int;
  b: Bool;
  c: String;
}

contract InlineStructs {
  s1: InnerStruct;
  s2: InnerStruct;

  init() {
    self.s1 = InnerStruct{a:1,b:true,c:"x"};
    self.s2 = InnerStruct{a:2,b:false,c:"y"};
  }
}