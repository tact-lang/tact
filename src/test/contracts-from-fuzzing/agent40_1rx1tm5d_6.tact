contract TestUnary {
    receive() {
        dump(-5);           // unary minus on literal, expecting -5
        dump(!true);        // unary not on literal, expecting false
        let opt: Int? = 123;  // optional integer initialized with 123
        dump(opt!!);        // non-null assertion, expecting 123
    }
}
