contract Test {
  fun foo(x: Int): Int {
    if (x > 0) {
      return x;
    }
    return -x;
  }
}
