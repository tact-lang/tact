extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMutates() {
    receive() {
        let a = 5;
        a.inc();
        require(a == 6, "inc did not work");
        cashback(sender());
    }
}
