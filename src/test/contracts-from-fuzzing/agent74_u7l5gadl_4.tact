contract TestPrimitiveTypes {
    fun test() {
        // Testing Int arithmetic and Boolean expressions
        let a: Int = 42;
        let b: Int = 2;
        let sum: Int = a + b; // Expected: 44
        dump(sum);

        let flag: Bool = (a > b); // Expected: true
        dump(flag);

        // Testing basic literals
        dump(0);           // integer literal
        dump(0xFF);        // hexadecimal literal
        dump(0b1010);      // binary literal
        dump(0o77);        // octal literal
        dump(true);        // boolean literal
        dump(false);

        // Testing Address creation using myAddress()
        let addr: Address = myAddress();
        dump(addr);
    }
    receive() {
        self.test();
        cashback(sender());
    }
}
