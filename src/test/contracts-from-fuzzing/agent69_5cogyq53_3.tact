contract TestOptionals() {
    fun test() {
        // Declare an optional Int and assign null
        let opt: Int? = null;
        // Reassign with a non-null value
        opt = 255;
        // Use non-null assertion operator: should yield 255
        let value: Int = opt!!;
        // Simple conditional branch
        if (opt != null) {
            // dump(value) would output 255
            dump(value);
        } else {
            dump(0);
        }
    }
    
    receive() {
        self.test();
        cashback(sender());
    }
}
