/*
Test 5: Verify struct parameter flattening in asm functions
- Define a struct AB with two Int fields
- asm function addAB should add the two integers (stack-based addition), expecting the flattening order: first field pushed first, second pushed second (top of stack) so that ADD consumes them
*/

struct AB { a: Int; b: Int }

asm fun addAB(two: AB): Int { ADD }

fun testAddAB() {
    let sum = addAB(AB { a: 10, b: 15 });
    // Expected sum: 25
}
