contract TestReceiverOrder {
    // This contract tests receiver ordering
    // According to documentation, if a message with literal "special" is received,
    // the receiver with signature receive("special") should be invoked over the one with a parameter of type String.

    receive("special") {
        dump(1);
    }

    receive(s: String) {
        dump(2);
    }

    receive(msg: Slice) {
        dump(3);
    }
}
