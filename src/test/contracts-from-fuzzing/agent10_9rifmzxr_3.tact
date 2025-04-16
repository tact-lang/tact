struct Constants {
    asciiConst: Int;
    tonConst: Int;
    crcVal: Int;
}

contract ConstTest {
    // Compile-time constants evaluated via built-in functions
    const asciiConst: Int = ascii("⚡");         // expected 14850721
    const tonConst: Int = ton("1");              // expected 1000000000
    const crcVal: Int = crc32("000DEADBEEF000"); // expected 1821923098

    get fun constants(): Constants {
        return Constants{
            asciiConst: self.asciiConst,
            tonConst: self.tonConst,
            crcVal: self.crcVal
        };
    }
}
