extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMutate {
    receive() {
        let x = 5;
        x.inc();
        dump(x); // Expected output: 6
    }
}
