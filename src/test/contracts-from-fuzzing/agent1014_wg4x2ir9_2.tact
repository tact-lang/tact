struct DeepNested {
  inner: NestedStruct;
}

struct NestedStruct {
  x: Int;
  y: Bool;
}

contract TestContract {
  deepField: DeepNested = DeepNested{ inner: NestedStruct{ x: 1, y: true } };
}
