fun test_invalid_chain_id(): Address {
    // Attempt to create an address with an invalid chain id; only 0 and -1 are allowed per documentation
    return newAddress(1, 0);
}
