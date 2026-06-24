contract TestBoolExpressions {
    fun showcase() {
        // Testing boolean expressions
        let factual: Bool = !!(true || false); // expected true
        dump(factual);

        let check: Bool = false && true; // expected false
        dump(check);

        // Testing ternary operator: false ? 1 : (false ? 2 : 3) -> expected 3
        let ternary: Int = false ? 1 : (false ? 2 : 3);
        dump(ternary);
    }

    receive() {
        self.showcase();
    }
}
