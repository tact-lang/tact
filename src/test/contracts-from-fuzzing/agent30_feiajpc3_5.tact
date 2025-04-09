fun test_forceBasechain_fail() {
    // Create a masterchain address using valid masterchain id (-1)
    let a: Address = newAddress(-1, 0x11223344556677889900aabbccddeeff00112233445566778899aabbccddeeff);
    // forceBasechain should throw an error (exit code 138) because the address is not basechain
    dump(forceBasechain(a));
}

fun main() {
    test_forceBasechain_fail();
}
