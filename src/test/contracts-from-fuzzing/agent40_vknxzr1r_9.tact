contract Dummy {}

fun testHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy();
    // Create a dummy sender address using a valid 256-bit hash literal (64 hex digits)
    let senderAddr: Address = newAddress(0, 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef);
    // Use the extension function hasSameBasechainAddress. This function only compares basechain addresses
    return s.hasSameBasechainAddress(senderAddr);
}

fun main() {
    testHasSameBasechainAddress();
    return;
}
