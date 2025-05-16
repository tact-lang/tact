trait CTrait {
    // Virtual constant in a trait with a default value
    virtual const MY_CONST: Int = 100;
}

contract TestConst() with CTrait {
    // Overriding the virtual constant
    override const MY_CONST: Int = 200;

    receive() {
        // Dump the constant; expecting 200
        dump(self.MY_CONST);
        cashback(sender());
    }
}
