struct NestedStruct {
  x: Int;
  y: Int;
}

struct OuterStruct {
  inner: NestedStruct;
  flag: Bool;
}

contract StructContract {
  data: OuterStruct = OuterStruct{
    inner: NestedStruct{ x: 7, y: 11 },
    flag: true
  };

  init() {}
}