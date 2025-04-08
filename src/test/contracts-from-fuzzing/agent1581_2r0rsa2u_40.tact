struct Inner {
  x: Int;
  y: Int;
}

contract InlineAssign {
  a: Inner = Inner{x:1,y:2};
}