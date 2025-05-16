fun testUnaryPlus(): Int {
    // Attempt to use unary plus operator, which is not defined as a unary operator
    let x: Int = +5;
    return x;
}

fun main(): Int {
    return testUnaryPlus();
}
