contract ConstExprDefaults {
  a: Int = 2 + 3 * 4;
  b: Int = (1 << 5) | 7;
  c: Bool = !(false || false);
  s: String = "abc";
  init() {}
}