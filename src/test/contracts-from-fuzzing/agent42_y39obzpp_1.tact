contract TestPrimitives {
    fun test() {
        // Testing primitive types
        let a: Int = 1 + 2;
        let b: Bool = true;
        let c: String = "hello";
        let d: Cell = "hi".asComment();
        let e: Address = myAddress();
        dump(a);
        dump(b);
        dump(c);
        dump(d);
        dump(e);
    }

    // A dummy receive function to force inclusion
    receive() { cashback(sender()); }
}
