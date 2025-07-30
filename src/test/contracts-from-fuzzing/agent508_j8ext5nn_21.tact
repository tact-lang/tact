contract MutateInitParam(a: Int, b: Bool) {
    // init() {} is not allowed here by spec
    // Try mutate param in a receiver
    receive() {
        self.a = 1234;
        self.b = false;
    }
}
