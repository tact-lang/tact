/// Test 6: Assembly function with a struct parameter and primitive return
// The struct AB has two fields: a and b, which are pushed onto the stack.
// The ADD instruction adds the two values, so the return should be a + b.

struct AB { a: Int; b: Int }

asm fun sumAB(two: AB): Int { ADD }

fun testSumAB() {
    let result = sumAB(AB{ a: 10, b: 20 });
}
