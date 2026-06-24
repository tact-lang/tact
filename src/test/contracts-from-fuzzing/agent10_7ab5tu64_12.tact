extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMutate {
    get fun test(): Int {
        let a: Int = 10;
        a.inc();
        return a; // Expected 11
    }
}
