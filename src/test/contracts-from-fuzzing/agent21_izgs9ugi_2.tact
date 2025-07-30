contract TestInts {
    fun showcase() {
        // Testing integer literal expressions
        let a = 0;       // decimal literal
        let b = 42;      // another decimal literal
        let c = 1_000;   // numeric separator literal
        a; b; c;         // return or use expressions
    }

    receive() {
        self.showcase();
    }
}
