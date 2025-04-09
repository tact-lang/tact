struct NestedStruct {
  inner: InnerStruct
}

struct InnerStruct {
  value: Int
}

contract Test {
  receive() {
    let n: NestedStruct = NestedStruct{inner: InnerStruct{value: 7}};
  }
}