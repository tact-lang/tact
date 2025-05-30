contract Test {
    // Valid address input. Using a valid 66-character long Tact address
    // Format: 0: followed by 64 hex digits.
    const a: Address = address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef");

    // Dummy receive function to allow contract compilation
    receive() {}
}
