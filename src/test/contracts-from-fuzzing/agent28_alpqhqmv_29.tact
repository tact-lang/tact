struct BooleanStruct {
  flag: Bool
}

contract Test {
  receive() {
    let b: BooleanStruct = BooleanStruct{flag: true};
  }
}