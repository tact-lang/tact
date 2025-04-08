struct NestedArray {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
}

contract TestLongStruct {
  storage: NestedArray;
  init() {
    self.storage = NestedArray{
      a:1,b:2,c:3,d:4,e:5
    };
  }
}
