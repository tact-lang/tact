struct Deep {
  a: Int = 1 + 2 * 3;
  b: Int = (5 | 2) & 7;
  s: String = "abcdef";
}

contract Test(
  nested: Deep,
) {}
