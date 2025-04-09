fun customPow(a: Int, c: Int): Int {
  let res: Int = 1;
  repeat(c) {
    res *= a;
  }
  return res;
}

// Testing the function
fun main(): Int {
  return customPow(2, 3); // expect 8
}
