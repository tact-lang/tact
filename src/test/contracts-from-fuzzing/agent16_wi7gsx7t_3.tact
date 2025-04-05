struct Constants {
    tonValue: Int;
    asciiValue: Int;
    crcValue: Int;
}

contract TestConstants() {
    // Constants computed at compile time
    const tonValue: Int = ton("1");
    const asciiValue: Int = ascii("⚡");
    const crcValue: Int = crc32("000DEADBEEF000");

    // Get method to fetch the constants, accessing them via self
    get fun getConstants() : Constants {
         return Constants{ tonValue: self.tonValue, asciiValue: self.asciiValue, crcValue: self.crcValue };
    }
}
