contract TestPrimitive() {
    fun run() {
        let a: Int = 42;
        let b: Int = 1_000;
        let c: Int = a + b;
        dump(c); // expected output: 1042
    }
    receive() {
        self.run();
    }
}
