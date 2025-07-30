message A {}
message B {}

contract Test {
  receive(msg: A) {}
  receive(msg: B) {}
}