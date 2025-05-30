fun testTernary(x: Int): String {
    return x > 5 ? "big" : "small";
}

fun main() {
    dump(testTernary(10));
    dump(testTernary(2));
}
