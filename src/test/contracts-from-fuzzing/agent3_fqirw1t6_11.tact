fun testDivMod(): Int {
    // Test the identity: a / b * b + a % b == a
    let a: Int = (37 / 5) * 5 + 37 % 5;    // Expected: 37, because 37/5 = 7, remainder 2: (7*5+2=37)
    let b: Int = (100 / 7) * 7 + 100 % 7;     // Expected: 100
    return a + b; // Expect 37 + 100 = 137
}

fun main(): Int {
    return testDivMod();
}
