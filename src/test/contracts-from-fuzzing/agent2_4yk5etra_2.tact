contract TestPrimitive {
    fun run() {
        let a: Int = 1 + 1;
        dump(a); // expected output: 2
    }
    receive() {
        self.run();
    }
}
