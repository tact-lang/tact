contract TestUnicodeNormalization {
    receive() {
        // Test if two different Unicode representations of the same visual content are equal.
        // "café" using precomposed 'é' vs. "cafe\u{0301}" which uses 'e' plus combining accent.
        let s1: String = "café";
        let s2: String = "cafe\u{0301}";
        dump(s1 == s2);
    }
}
