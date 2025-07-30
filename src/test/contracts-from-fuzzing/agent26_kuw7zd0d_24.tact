contract TestNonAsciiAsciiFunction {
    receive() {
        // Testing ascii() function with a non-ASCII character
        // 'ñ' is encoded in UTF-8 as two bytes; according to documentation, up to 8 Unicode code points of up to 4 bytes each are allowed in ascii().
        let value: Int = ascii("ñ");
    }
}
