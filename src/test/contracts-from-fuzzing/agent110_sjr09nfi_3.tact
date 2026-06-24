contract TestEscape {
    receive() {
        let s: String = "Line \n NewLine \r Tab \t \"Quoted\" \x22 \u{1F602}";
        dump(s);
    }
}
