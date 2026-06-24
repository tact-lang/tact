fun testMasterchain() {
    // Using masterchain id (-1) – if masterchain support isn’t enabled,
    // this may produce an error (exit code 137) at runtime, but should compile
    let a: Address = newAddress(-1, 0);
}

fun main() {
    testMasterchain();
}
