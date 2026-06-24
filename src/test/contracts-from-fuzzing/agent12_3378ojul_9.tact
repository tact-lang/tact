/// Test asm function with comments and extra whitespace in the body
asm fun testComments(x: Int): Int {
    // Push 1 onto the stack
    1 PUSHINT
    
    // Duplicate the parameter x (already on the stack)
    DUP
    
    // Add top two values: x + 1
    ADD
}

fun main() {
    let res = testComments(41); // Expected 41 + 1 = 42
}
