contract Test {
    receive() {
        let s: String = "Newline \n, Tab \t, Quote \" and Backslash \\ ";
        dump(s);
    }
}
