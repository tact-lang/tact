asm fun testAsm(): Int {
    { "nested { } block" }
    "outer string \"quoted\""
    /* a multi-line comment inside assembly */
    { "another nested block" "deeply nested" }
    42 PUSHINT
}

fun main() {
    testAsm();
}
