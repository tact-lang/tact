contract TestOptionalValid() {
    fun run() {
        let opt: Int? = null;
        opt = 123;
        dump(opt!!); // should output 123
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
