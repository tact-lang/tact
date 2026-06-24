fun decodeLongBase64(): Slice {
    /* 200 'A' characters, each is 6 bits in base64 => 1200 bits total, which is > 1023.
       Docs say fromBase64() only takes the first 1023 bits and does NOT throw exceptions for length.
       Let's see if the compiler actually compiles or complains. */
    return "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA".fromBase64();
}

contract TestContract {
    receive() {
        let x = decodeLongBase64();
    }
}
