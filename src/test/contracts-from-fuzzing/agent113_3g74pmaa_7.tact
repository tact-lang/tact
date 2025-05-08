contract UnicodeEscape {
    receive() {
        // Testing various Unicode escape sequences
        let s: String = "Start \u0000 Middle \uFFFF End \u{1F602}";
        s;
    }
}
