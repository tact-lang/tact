contract TestPrimitives() {
    fun run() {
        // Testing Integers
        let i: Int = 1 + 1; // expected 2
        dump(i);

        // Testing Booleans
        let b: Bool = true && false; // expected false
        dump(b);

        // Testing Strings and conversion to Cell
        let s: String = "Hello, Tact!";
        dump(s);
        let c: Cell = s.asComment();
        dump(c);

        // Testing Address: using myAddress()
        let addr: Address = myAddress();
        dump(addr);

        // Testing Cell directly
        let emptyC: Cell = emptyCell();
        dump(emptyC);
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
