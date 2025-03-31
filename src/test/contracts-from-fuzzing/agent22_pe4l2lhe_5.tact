/// Test: Empty asm function body
// According to documentation, asm functions should have a body with TVM instructions.
// This snippet attempts to compile an asm function with an empty body.
asm fun emptyBody(): Int { 
    // intentionally empty
}

fun testEmptyBody() {
    let v: Int = emptyBody();
}
