extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestLiteralMutation {
    receive() {
        // Attempt to call a mutation extension on an integer literal
        dump(5.inc());
        cashback(sender());
    }
}
