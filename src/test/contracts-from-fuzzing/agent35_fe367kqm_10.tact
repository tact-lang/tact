fun catchTest() {
    try {
        // This require will fail and throw an exit code based on the hash of "Test Error"
        require(false, "Test Error");
    } catch (code) {
        // Dump the caught exit code (should be outside the TVM reserved range)
        dump(code);
    }
}

fun runTest() {
    catchTest();
}
