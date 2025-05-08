contract TestContract {
    const base: Int = 123;
    foo: Int = self.base;

    init() {
        self.foo = self.base;
    }

    receive() {
        let _ = self.foo + self.base;
    }
}