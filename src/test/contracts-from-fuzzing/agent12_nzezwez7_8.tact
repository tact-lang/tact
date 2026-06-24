/* Test 8: Conversion to Cell using .toCell()
   Expected: Compiles successfully, returns 15 (5+10).
*/

struct A {
    a: Int;
    b: Int;
}

fun main(): Int {
    let a1 = A{ a: 5, b: 10 };
    let cell = a1.toCell();
    // cell is not inspected here but conversion should succeed
    return a1.a + a1.b;
}
