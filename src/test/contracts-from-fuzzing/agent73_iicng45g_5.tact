contract Playground {
    receive("plays") {
        // Unary operators
        dump(-5);         // unary negation
        dump(!false);     // logical NOT
        let opt: Int? = 10;
        dump(opt!!);      // non-null assertion
    }
}
