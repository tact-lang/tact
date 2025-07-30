contract Test {
    receive() {
        let s: String = "Line1\nLine2\tTabbed\"Quote\"";
        dump(s);
    }
}
