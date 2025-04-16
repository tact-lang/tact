contract TestStringEscape {
    receive() {
        let s: String = "Line 1\nLine 2\tTabbed";
        dump(s);
    }
}