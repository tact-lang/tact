fun customPow(a: Int, c: Int): Int {
  let res: Int = 1;
  repeat(c) {
    res *= a;
  }
  return res;
}
