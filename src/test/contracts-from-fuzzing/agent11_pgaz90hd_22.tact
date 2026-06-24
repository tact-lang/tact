contract TestToFloatString() {
    // Testing the extension function toFloatString for an integer.
    // According to the documentation, 5.toFloatString(9) should produce a string representing 5 in Toncoin format with 9 fractional digits, i.e. "0.000000005".
    
    receive() {
        dump(5.toFloatString(9));
    }
}
