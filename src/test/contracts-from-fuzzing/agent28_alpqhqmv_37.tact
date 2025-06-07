struct OptionalStruct {
  inner: InnerStruct?
}

struct InnerStruct {
  value: Int
}

contract Test {
  receive() {
    let o: OptionalStruct = OptionalStruct{inner: null};
  }
}