contract TestLiterals {
    receive("plays") {
        let a: Int = 42;          // Integer literal
        let b: Bool = true;         // Boolean literal
        let s: String = "Hello, Tact!";  // String literal

        dump(a);
        dump(b);
        dump(s);
    }
}
