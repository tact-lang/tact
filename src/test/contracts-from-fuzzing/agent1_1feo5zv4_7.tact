trait VirtualInit {
    virtual const VAL: Int = 10;
}

contract C with VirtualInit {
    persistent: Int;

    init() {
        self.persistent = self.VAL + 5;  // expected: 10 + 5 = 15
    }

    receive() {
        dump(self.persistent);
        cashback(sender());
    }
}
