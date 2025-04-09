contract TestPrimitive() {
    fun run() {
        let a: Int = 5;
        let b = 3;
        let sum = a + b;
        let flag: Bool = true || false;
        let addr: Address = myAddress();
        dump(sum);
        dump(flag);
        dump(addr);
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
