contract MutateReceive {
    foo: Int;

    init() {
        self.foo = 1;
    }

    receive() {
        self.foo = self.foo + 1;
    }
}