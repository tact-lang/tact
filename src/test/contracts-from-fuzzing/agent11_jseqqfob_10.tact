// Test A: Assembly function to double a value using DUP and ADD
asm fun doubleVal(x: Int): Int { x DUP ADD }

fun main() {
    let result = doubleVal(7); // Expected: 14
    let _dummy = result;
}
