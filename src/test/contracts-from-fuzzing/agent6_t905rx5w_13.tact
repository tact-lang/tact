extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestLiteral {
    receive() {
        // Valid: calling on a mutable variable
        let five = 5;
        five.inc(); // should compile and mutate five to 6
        dump(five);

        // Invalid: calling on a literal is not allowed because literals cannot be mutated
        5.inc();
        dump(5);
    }
}
