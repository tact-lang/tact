contract TestLiterals_BoolString {
    receive() {
        let b: Bool = false;
        let s: String = "Tact Compiler";
        dump(b);
        dump(s);
    }
}
