// Test 4: Non-extension asm function with a parameter and empty body
// According to docs, it should automatically return the value of the parameter (x), if nothing is done?
// However, this might be ambiguous. We'll test what the compiler does.
asm fun identity(x: Int): Int { }

fun main() {
    identity(42);
}
