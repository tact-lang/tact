contract TestStringEscapes {
    receive() {
        // testing escape sequences: newline \n, tab \t, double quote \"
        let str: String = "First Line\nSecond Line with a tab\tand a \"quote\"";
        dump(str);
    }
}
