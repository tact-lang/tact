// Inline function test
inline fun inc(x: Int): Int { return x + 1; }

fun testInline(): Int {
    return inc(10);
}
