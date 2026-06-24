asm fun addAsm(x: Int, y: Int): Int { x y ADD }

fun testAddAsm(): Int {
  return addAsm(5, 7);
}

// Additional fuzz-test: mixing assembly functions with ordinary functions and return statements
fun combinedTest(x: Int): Int {
  // If x is even, use the asm addition, otherwise use multiReturnTest
  if ((x % 2) == 0) {
    return addAsm(x, 10);
  } else {
    return multiReturnTest(x);
  }
}

// Included multiReturnTest from previous snippet
fun multiReturnTest(x: Int): Int {
  if (x < 0) {
    return -x;
  } else if (x == 0) {
    { return 100; }
  } else {
    return x;
  }
}
