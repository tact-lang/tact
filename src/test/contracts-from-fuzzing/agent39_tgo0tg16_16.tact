contract TestUnaryInverse {
    receive() {
        let notTrue: Bool = !true;         // expected: false
        let notNotFalse: Bool = !(!false);   // expected: false
        dump(notTrue);
        dump(notNotFalse);
    }
}
