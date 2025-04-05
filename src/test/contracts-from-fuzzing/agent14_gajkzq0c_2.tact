contract Test {
    fun test() {
        let a: Int = 42;
    }

    receive() {
        self.test();
    }
}