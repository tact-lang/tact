contract OptionalAssignChain {
    a: Int? = null;
    b: Int? = null;

    init() {
        self.a = 42;
        self.b = self.a;
    }

    receive() {
        self.b = self.a;
    }
}