contract TestAddressLiteral {
    receive() {
        // Test Address literal: using address() function with a valid basechain address string
        let addr: Address = address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef");
        dump(addr.toString());
    }
}
