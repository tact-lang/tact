contract TestEscapes {
    receive() {
        let s: String = "Line \nBreak \tTab \\Backslash \"Quote\" \x41 \u0042 \u{43}";
    }
}
