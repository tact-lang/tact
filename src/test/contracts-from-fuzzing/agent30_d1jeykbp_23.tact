contract TestStringEscapes {
    receive() {
        let s: String = "This is a test:\nLine break, \t tab, \\ backslash, \" quote, \u{1F602} emoji";
        dump(s);
    }
}
