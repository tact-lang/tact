extends mutates fun inc(self: Int) {
    self += 1;
}

contract Test() {
    receive() {
        let a = 5;
        a.inc();
        dump(a);
    }
}
