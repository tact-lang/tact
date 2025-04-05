struct S { x: Int; }

extends mutates fun inc(self: S) {
    self.x = self.x + 1;
}

contract TestContract2 {
    receive() {
        let s = S{ x: 10 };
        s.inc();
        cashback(sender());
    }
}
