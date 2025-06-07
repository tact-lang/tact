extends mutates fun inc(self: Int) {
    self = self + 1;
}

contract TestMutation {
    receive() {
        let a = 10;
        a.inc();
        dump(a);
    }
}
