message ManyFields {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
  g: Int;
  h: Int;
}

contract Test {
  receive(msg: ManyFields) {}
}