contract TestUnicodeEscape {
    receive() {
        let s: String = "\x41 \u0042 \u{43}";
    }
}
