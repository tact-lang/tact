struct IntStruct {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
}

struct BoolStruct {
  x: Bool;
  y: Bool;
  z: Bool;
}

contract MixNested {
  ints: IntStruct;
  bools: BoolStruct;

  init() {
    self.ints = IntStruct{a:1,b:2,c:3,d:4};
    self.bools = BoolStruct{x:true,y:false,z:true};
  }
}
