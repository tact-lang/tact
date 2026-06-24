contract TestAddressLiteral {
    receive() {
        // Testing address literal expression using address() function
        let a: Address = address("0:abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789");
    }
}
