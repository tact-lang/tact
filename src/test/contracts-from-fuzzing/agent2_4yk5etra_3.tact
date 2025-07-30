contract TestOptionalValid {
    fun run() {
        let opt: Int? = null;
        opt = 42;
        dump(opt!!); // expected output: 42
    }
    receive() {
        self.run();
    }
}
