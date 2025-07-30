contract Test {
    receive() {
        let s: String = "Boundary test \u{10FFFF}";
        dump(s);
    }
}