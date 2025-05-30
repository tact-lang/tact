fun testLogicalOperations(): Int {
    // test logical AND: false && (1/0 == 0) should short-circuit to false, so ternary should yield 0
    let a: Int = (false && (1 / 0 == 0)) ? 1 : 0;
    // test logical OR: true || (1/0 == 0) should short-circuit to true, so ternary should yield 1
    let b: Int = (true || (1 / 0 == 0)) ? 1 : 0;
    return a + b; // expected 0 + 1 = 1
}

fun main(): Int {
    return testLogicalOperations();
}
