contract MyContract() {}

fun testCode() {
    // Obtain the code of the contract MyContract using codeOf
    let code = codeOf MyContract;
    // dump() is allowed for Cell type, so we dump the cell containing the code...
    dump(code);
}

// Trigger the test function
fun runTest() {
    testCode();
}
