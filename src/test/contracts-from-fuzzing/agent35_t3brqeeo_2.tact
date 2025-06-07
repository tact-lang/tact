struct Constants { ascii: Int; crc: Int; ton: Int; }

contract Test {
    // Contract-level constants, accessible only via 'self'
    const val_ascii: Int = ascii("⚡");
    const val_crc: Int = crc32("000DEADBEEF000");
    const val_ton: Int = ton("1");

    // Correctly reference contract-level constants using 'self'
    get fun getConstants(): Constants {
        return Constants { ascii: self.val_ascii, crc: self.val_crc, ton: self.val_ton };
    }
}
