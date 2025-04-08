contract TestContract {
    foo: Int = 1;
    bar: Bool = true;

    init() {
        self.foo = 2;
        self.bar = false;
    }

    receive() {
        self.foo = self.foo + 1;
        self.bar = !self.bar;
    }
}