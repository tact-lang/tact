contract TestBoolean {
    fun run() {
        // Expected: false
        let result: Bool = true && false;
        dump(result);
    }
    receive() {
        self.run();
    }
}
