struct NestedStruct {
  x: Int;
  y: Bool;
  z: String;
}

struct OuterStruct {
  nested: NestedStruct;
  flag: Bool;
  text: String;
}

contract TestNested {
  os: OuterStruct;

  init() {
    self.os = OuterStruct{
      nested: NestedStruct{ x:1, y:true, z:"a" },
      flag: false,
      text: "b"
    };
  }
}