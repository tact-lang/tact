contract TestAllValidEscapes {
    receive() {
        // Test a string literal with all valid escape sequences.
        // Valid escapes: \\ (backslash), \" (double quote), \n (newline), \r (carriage return), \t (tab), \v (vertical tab), \b (backspace), \f (form feed),
        // \x00 and \xFF (hexadecimal escapes), \u0000 and \uFFFF (fixed-length Unicode), \u{1} and \u{10FFFF} (variable-length Unicode)
        let s: String = "Test all: \\ \" \n \r \t \v \b \f \x00 \xFF \u0000 \uFFFF \u{1} \u{10FFFF}";
        dump(s);
    }
}
