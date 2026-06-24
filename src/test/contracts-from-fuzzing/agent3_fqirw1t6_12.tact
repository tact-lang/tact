fun testNonNull(): Int {
    // 'maybe' is an optional Int with non-null value 5
    let maybe: Int? = 5;
    return maybe!!;  // non-null assertion should succeed
}

fun main(): Int {
    return testNonNull();
}
