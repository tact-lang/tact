message Something {
  y: Int = 5
}

message Another {
  x: Int
}

contract Test {
  receive(msg: Something) {}
}