// Test 5: Assembly function that discards two numbers using DROP2 (no return type specified)
asm fun discardTwo(a: Int, b: Int) { DROP2 }

fun main() {
    discardTwo(10, 20);
}
