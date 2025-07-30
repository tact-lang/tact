contract TestContract {
    receive() {
        // Test string literal with Unicode escape sequence \u
        // Greek capital letter omega (Ω) is U+03A9
        let s: String = "Unicode test: \u03A9";
        dump(s);
    }
}
