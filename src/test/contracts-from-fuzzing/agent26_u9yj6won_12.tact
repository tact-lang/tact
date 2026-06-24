contract SomeContract {}

fun testHasSameBasechainAddressMismatch() : Bool {
    let init = initOf SomeContract();
    // Compare with a different address (basechain) than the one of the contract
    return !init.hasSameBasechainAddress(newAddress(0, 0x123));
}
