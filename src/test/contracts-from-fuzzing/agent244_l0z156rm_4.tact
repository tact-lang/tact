fun ctTernaryReturn(x: Int): Int {
  return (x > 0) ? 111 : 222;
}

contract Test {
  a: Int = ctTernaryReturn(-1);
}