// Test 6: asm fun bad() with unattached primitive should trigger compilation error
asm fun bad(): Int { 43 }

fun main() {
    let a = bad();
}
