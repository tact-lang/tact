trait TraitConst {
    // Virtual constant with default value
    virtual const v: Int = 123;
}

contract TestConst() with TraitConst {
    receive() {
        dump(self.v); // expected output: 123
        cashback(sender());
    }
}
