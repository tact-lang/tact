contract TestUnicode {
    receive() {
        // Testing string literal with Unicode emojis
        let s: String = "⚡⚡";
        let _ = s.asSlice();
    }
}
