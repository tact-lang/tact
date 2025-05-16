contract TestPrimitive() {
    fun test() {
        let a: Int = 1 + 1;
        let b: Bool = true && false;
        let c: Address = myAddress();
        dump(a);
        dump(b);
        dump(c.asSlice());
    }
    
    receive() {
        self.test();
        cashback(sender());
    }
}
