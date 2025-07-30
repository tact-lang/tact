struct CompiledConstants {
    A: Int;
    T: Int;
    C: Int;
    S: Int;
}

contract TestConsts {
    // Constant evaluation using compile-time functions
    // Expected: ascii("⚡") -> 14850721 (0xE29AA1)
    const A: Int = ascii("⚡");
    // Expected: ton("1") -> 1000000000
    const T: Int = ton("1");
    // Expected: crc32("000DEADBEEF000") -> 1821923098
    const C: Int = crc32("000DEADBEEF000");
    // Expected: sha256("Test SHA256") is computed at compile-time
    const S: Int = sha256("Test SHA256");

    // Getter returns the compile-time evaluated constants as a struct
    get fun getConsts(): CompiledConstants {
        return CompiledConstants { A: self.A, T: self.T, C: self.C, S: self.S };
    }

    // Dummy receiver
    receive() { return; }
}
