contract TestStringEscapes {
    receive() {
        let s: String = "This is a \"test\" string with newline \n and tab \t at the end";
        dump(s);
    }
}
