extends fun inc(self: Int): Int {
    return self + 1;
}

extends mutates fun incMut(self: Int) {
    self = self + 1;
}

contract ExtTest {
    receive() {
        let a = 5.inc();
        // Expected: 6
        dump(a);

        let b = 7;
        b.incMut();
        // Expected: 8
        dump(b);
    }
}
