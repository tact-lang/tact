struct NestedLarge {
  aa: Int;
  bb: String;
  cc: Bool;
  dd: Int;
  ee: String;
  ff: Bool;
  gg: Int;
  hh: String;
  ii: Bool;
  jj: Int;
}

contract LargeNestedStruct {
  storage: NestedLarge;

  init() {
    self.storage = NestedLarge{
      aa:1, bb:"b", cc:true, dd:2, ee:"e",
      ff:false, gg:3, hh:"h", ii:true, jj:4
    };
  }
}