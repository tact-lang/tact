/* Test: Arithmetic operator precedence
   This function tests that multiplication has higher precedence than addition.
   According to standard operator precedence, 1 + 2 * 3 should be evaluated as 1 + (2 * 3) = 7.
*/

fun arithmeticTest(): Int {
    return 1 + 2 * 3;
}

fun main(): Int {
    return arithmeticTest();
}
