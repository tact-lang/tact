extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMut() {
    receive() {
        let a = 5;
        a.inc();
        dump(a);
    }
}
