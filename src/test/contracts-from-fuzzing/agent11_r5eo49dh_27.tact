message MyMsg {
  x: Int;
}

const myConst: MyMsg = MyMsg{x: 5};

contract Test {
  receive() {
    let x = myConst;
  }
}