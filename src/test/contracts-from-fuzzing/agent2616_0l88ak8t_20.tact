struct NestedStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
}

contract MultiNested {
  s1: NestedStruct;
  s2: NestedStruct;
  s3: NestedStruct;

  init() {
    self.s1 = NestedStruct{a:1,b:true,c:"a",d:myAddress()};
    self.s2 = NestedStruct{a:2,b:false,c:"b",d:myAddress()};
    self.s3 = NestedStruct{a:3,b:true,c:"c",d:myAddress()};
  }
}