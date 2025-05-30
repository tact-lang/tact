extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMut() {
    receive() {
        let x = 10;
        x.inc();
        dump(x);
    }
}
