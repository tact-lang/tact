/// Test 9: asm function with empty body but declared return type
asm fun identityEmpty(x: Int): Int { }

fun main() {
    let a = identityEmpty(42);
}
