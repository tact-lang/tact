extends fun double(self: Int): Int {
    return self * 2;
}

extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestExt() {
    get fun test(): Int {
        let a = 10;
        a.inc();
        return a.double(); // expected: 11 * 2 = 22
    }
    
    receive() {
        let _ = self.test();
        cashback(sender());
    }
}
