contract TestOptionalValid {
    fun run() {
        // A valid use of optional
        let opt: Int? = null;
        opt = 100;
        dump(opt!!); // should dump 100
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
