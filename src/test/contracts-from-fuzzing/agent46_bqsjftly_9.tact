extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMut() {
    get fun run(): Int {
        let a = 10;
        a.inc();
        return a; // Expected result: 11
    }
}
