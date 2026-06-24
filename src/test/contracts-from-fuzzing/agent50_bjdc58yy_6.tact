contract TestUnary {
    receive() {
        // Unary not operator on booleans
        dump(!true);       // expected: false
        dump(!false);      // expected: true
        // Double negation
        dump(!!true);      // expected: true
    }
}
