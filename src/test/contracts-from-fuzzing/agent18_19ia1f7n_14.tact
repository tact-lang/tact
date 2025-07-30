contract Test {
    receive() {
        // Testing a string containing a variety of escape sequences:
        //   \n  : newline
        //   \r  : carriage return
        //   \t  : tab
        //   \v  : vertical tab
        //   \b  : backspace
        //   \f  : form feed
        //   \\ : backslash
        //   \" : double quote
        //   \x41: hexadecimal escape (A)
        //   \u0042: Unicode escape (B)
        //   \u{1F602}: Extended Unicode (😂)
        let s: String = "Mixed: \n, \r, \t, \v, \b, \f, \\\", \" and hex \x41 and unicode \u0042 and extended \u{1F602}";

        // Convert to slice and back to string to test round-trip conversion
        let slice: Slice = s.asSlice();
        let s2: String = slice.asString();

        // Use dump to output whether the original and round-tripped strings are equal
        dump(s == s2);
    }
}
