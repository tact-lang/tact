contract TestUnicodeNormalization {
    receive() {
        // Unicode normalization is not performed - the strings should remain as their original byte sequences
        let s1: String = "\u00C5";    // LATIN CAPITAL LETTER A WITH RING ABOVE (Å)
        let s2: String = "A\u030A";    // LATIN CAPITAL LETTER A followed by COMBINING RING ABOVE
        // Even though they are canonically equivalent in Unicode, Tact should compare them as different byte sequences
        require(s1 != s2, "Normalization error: s1 and s2 should not be equal");
    }
}
