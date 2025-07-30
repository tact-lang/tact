contract TestAscii {
    // Using the built-in compile-time function ascii() to convert a string to its integer representation.
    // For the character '⚡', the expected integer is 14850721 (0xE29AA1) as documented.
    const LIGHTNING: Int = ascii("⚡");

    // Getter function to retrieve the value of the constant.
    get fun getLightning(): Int {
        return self.LIGHTNING;
    }
}
