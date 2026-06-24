contract TestAddressValid {
    // Testing address with a valid 64-hex-digit address format prefixed by '0:'
    a: Address = address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef");
    receive() {}
}
