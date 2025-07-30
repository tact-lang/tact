// Test 2: Using a parameter name in the asm function body, which should cause a compilation error because parameters are not directly accessible as instructions
asm fun accessesParam(x: Int): Int { x }

fun main() {
    accessesParam(5);
}
