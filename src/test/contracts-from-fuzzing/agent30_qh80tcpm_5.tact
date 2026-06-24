extends mutates fun inc(self: Int) {
    self += 1;
}

contract MutTest {
    receive() {
        // Attempt to call mutation extension on a literal value
        5.inc();
        cashback(sender());
    }
}
