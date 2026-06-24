fun testValidNewAddress(): Address {
    // Valid: workchain id 0 and a valid hash (dummy hex literal)
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// Also valid: using masterchain id -1
fun testValidMasterchainAddress(): Address {
    return newAddress(-1, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
}
