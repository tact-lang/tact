contract TestCond {
  fun test(x: Int) : Int {
    if (x > 0) {
      return 1;
    } else if (x < 0) {
      return -1;
    }
    return 0;
  }
}
