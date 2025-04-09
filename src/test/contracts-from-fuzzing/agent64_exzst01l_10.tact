contract TestTernary {
    receive() {
        // Basic ternary expression
        let a: Int = true ? 10 : 20;
        dump(a);

        // Ternary with arithmetic condition
        let b: String = (5 > 3) ? "greater" : "lesser";
        dump(b);

        // Nested ternary, valid due to right associativity (evaluates to 2)
        let c: Int = false ? 1 : true ? 2 : 3;
        dump(c);
    }
}
