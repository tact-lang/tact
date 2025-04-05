message SingleField {
  value: Int
}

contract Test {
  receive(message: SingleField) {}
}