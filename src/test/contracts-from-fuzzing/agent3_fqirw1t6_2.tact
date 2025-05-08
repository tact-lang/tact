fun testMultiplicative(): Int {
  // Without parentheses: multiplication before subtraction
  let a: Int = 5 * 5 - 2;   // should be 23
  // With parentheses: forces subtraction first
  let b: Int = 5 * (5 - 2);   // should be 15
  return a - b; // 23 - 15 = 8
}

fun testNegation(): Int {
  // Test unary negation: -(-1) should be 1
  return -(-1);
}

fun testDoubleNeg(): Int {
  // Test double minus: according to docs, --1 should give 1
  return --1;
}

fun testShift(): Int {
  // Test bitwise right shift: 2 >> 1 should be 1
  let x: Int = 2;
  return x >> 1;
}

fun testModulo(): Int {
  // Test modulo operator with negative numbers
  let a: Int = 1 % 5;  // 1
  let b: Int = -1 % 5; // 4, as per docs
  return a + b; // expected 1 + 4 = 5
}

fun testBitwiseOr(): Int {
  // Test bitwise OR operator: 2 | 1 should be 3
  let a: Int = 2 | 1; 
  return a;
}

fun main(): Int {
  let res1: Int = testMultiplicative();    // expected 8
  let res2: Int = testNegation();            // expected 1
  let res3: Int = testDoubleNeg();           // expected 1
  let res4: Int = testShift();               // expected 1
  let res5: Int = testModulo();              // expected 5
  let res6: Int = testBitwiseOr();           // expected 3
  // Summing up: 8 + 1 + 1 + 1 + 5 + 3 = 19
  return res1 + res2 + res3 + res4 + res5 + res6;
}
