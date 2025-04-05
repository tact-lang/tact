message Wrapper {
  s: SomeStruct;
}

struct SomeStruct {
  amount: Int;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}