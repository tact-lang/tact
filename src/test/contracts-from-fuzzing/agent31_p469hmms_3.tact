contract TestUnary {
    receive("plays") {
        dump(-42);         // Unary minus
        dump(!true);        // Logical negation
    }
}
