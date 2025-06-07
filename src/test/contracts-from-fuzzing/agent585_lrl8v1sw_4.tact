struct Inner {
  x: Int;
  y: Bool?;  
}

contract Test {
  innerField: Inner = Inner{ x: 7 };
  receive() {}
}