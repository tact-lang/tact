extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMut {
    receive() {
        let a = 10;
        a.inc();
        dump(a); // expected: 11
        cashback(sender());
    }
}
