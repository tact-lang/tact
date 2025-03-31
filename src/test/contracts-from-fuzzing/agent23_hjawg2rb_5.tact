contract Test {
    fun testOptional() {
        let opt: Int? = 42;
        dump(opt);
    }

    receive() {
        self.testOptional();
    }
}
