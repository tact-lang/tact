contract SomeContract {}

fun testForceBasechainInvalid(): Address {
    let addr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    forceBasechain(addr);
    return addr;
}
