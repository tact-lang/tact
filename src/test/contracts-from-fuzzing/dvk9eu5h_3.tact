fun testLet(): Int {
    let a: Int = 123;
    let b = 123;  // inferred type
    return a + b;
}

fun main(): Int {
    return testLet();
}
