fun testArithmeticAugAssign(): Int {
    let a: Int = 10;
    a -= 3;  // a becomes 7
    a *= 2;  // a becomes 14
    a /= 7;  // a becomes 2
    a %= 3;  // a becomes 2
    a += 5;  // a becomes 7
    return a;
}

fun main() {
    testArithmeticAugAssign();
}
