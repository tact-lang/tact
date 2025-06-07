fun testBlock() : Int {
    { let a: Int = 42; }   // a simple block statement
    return 43;
}

fun main() : Int {
    return testBlock();
}
