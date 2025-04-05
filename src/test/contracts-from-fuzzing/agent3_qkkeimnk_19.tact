struct MyInt {
  x: Int;
}

contract Test {
  receive() {
    let a: MyInt = MyInt {x: 5};
  }
}