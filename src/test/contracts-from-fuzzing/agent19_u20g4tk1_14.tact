contract TestHighUnicode {
    receive() {
        let s: String = "\u{10FFFF}";
    }
}
