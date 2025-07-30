contract TestPrimitives() {
    fun run() {
        let a: Int = 3 / 2; // Expected: 1
        let b: Bool = (true && false) || true; // Expected: true
        dump(a);
        dump(b);
    }

    receive() {
        self.run();
    }
}
