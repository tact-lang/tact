extends mutates fun inc(self: Int) {
    self += 1;
}

contract UseInc() {
    receive() {
        let a = 5;
        a.inc();
        dump(a); // Expected output is 6
    }
}
