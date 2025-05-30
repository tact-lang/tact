contract TestAllEscapes {
    receive() {
        // Testing various valid escape sequences in a single string literal
        let s: String = "Line1\nLine2, tab:\t, vertical tab:\v, backspace:\b, form feed:\f, hex \x22, unicode fixed: \u0022, unicode variable: \u{1F602}, backslash: \\";
        dump(s);
    }
}
