contract TestAllEscapes {
    receive() {
        // Test all valid escape sequences in one string.
        // Expected output contains: backslash, double quote, newline, carriage return, tab, vertical tab, backspace, form feed, \x41 -> 'A', \u0042 -> 'B', \u{43} -> 'C'
        let s: String = "\\ \" \n \r \t \v \b \f \x41 \u0042 \u{43}";
        dump(s);
    }
}
