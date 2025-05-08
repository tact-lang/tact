contract TestCompileTimeExpressions {
    fun showcase() {
        // Testing compile-time only functions in expressions
        // ascii: should produce integer representation of "⚡" (expected 14850721)
        dump(ascii("⚡"));

        // crc32: expected output: 1821923098
        dump(crc32("000DEADBEEF000"));

        // ton: 1 Toncoin = 1_000_000_000 nanoToncoins, expected 1000000000
        dump(ton("1"));
    }
}
