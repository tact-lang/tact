contract TestContract {
    // Testing valid Unicode escape sequences: \u0041 and \u{41}
    fun testUnicode() : String {
        // \u0041 results in 'A', and \u{41} results in 'A', so we expect "AA"
        return "\u0041\u{41}";
    }

    receive() {
        dump(self.testUnicode());
    }
}
