// Test 7 (modified): Testing TVM instructions with no quotes (properly written) and testing that they are not interpreted as strings
asm fun myCodeCorrect(): Cell { MYCODE }

fun main() {
    myCodeCorrect();
}
