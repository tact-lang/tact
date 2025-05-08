struct WithOptional {
  foo: Int?
}

contract Test {
  receive() {
    let x = WithOptional {
      foo: null
    };
  }
}