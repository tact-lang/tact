contract TestValidUnicodeLong {
    receive() {
        // Using valid Unicode escapes with 1 to 6 hex digits
        let s: String = "\u{1F602} is funny and \u{1F926} is laughing";
    }
}
