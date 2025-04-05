contract TestTernary {
    receive() {
        // Ternary operator with Int result
        let a: Int = true ? 10 : 20;
        dump(a); // should dump 10

        // Ternary operator with String result
        let s: String = false ? "fail" : "pass";
        dump(s); // should dump "pass"

        // Nested ternary in alternative branch
        let b: Int = false ? 1 : (true ? 2 : 3);
        dump(b); // should dump 2
    }
}
