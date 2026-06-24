struct Node {
  val: Int;
  next: Int?;
}

contract TypeTest {
  receive() {
    let n: Node = Node { val: 1, next: null };
  }
}