fun testInvalidAddress() : Address {
    // This should fail, as the address literal is in an invalid format
    let a: Address = address("invalid_address_format");
    return a;
}
