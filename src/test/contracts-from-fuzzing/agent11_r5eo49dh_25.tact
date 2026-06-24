struct Example {
  a: Int;
}

const myConst: Example = Example{a: 1};

contract Test {
  receive() {
    let x = myConst;
  }
}