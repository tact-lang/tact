contract TestValidEscapes {
    receive() {
        // Testing valid escape sequences in a string literal
        let s: String = "Line1\nLine2\rLine3\tEnd\x21 \u0041 \u{1F602}";
        dump(s);
    }
}
