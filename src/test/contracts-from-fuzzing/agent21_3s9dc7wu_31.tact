message HasBool { flag: Bool }

contract Test {
  receive(m: HasBool) {}
}