contract TestStringEscapes {
    receive() {
        // Testing various string escape sequences
        let s: String = "escape test: \n, \t, \x41, \u0041, \u{41}";
        dump(s);
    }
}
