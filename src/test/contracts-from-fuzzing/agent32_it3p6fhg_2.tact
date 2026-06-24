contract ReturnAddressLiteral {
    get fun addr(): Address {
         return address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef");
    }
}
