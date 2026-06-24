const MyConst: Int = 5;

contract Test {
  receive() {
    let x: Int = MyConst;
  }
}