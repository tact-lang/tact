contract TestUnaryOperators {
    receive() {
        // Testing unary minus
        let negative: Int = -42;
        dump(negative);

        // Testing logical negation
        let notTrue: Bool = !true;
        let notFalse: Bool = !false;
        dump(notTrue);
        dump(notFalse);
    }
}
