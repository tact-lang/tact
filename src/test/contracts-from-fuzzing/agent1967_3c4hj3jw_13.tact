contract TestContract {
    foo: Int;
    bar: Int?;

    init() {
        self.foo = 5;
        self.bar = null;
    }

    receive() {
        if (self.bar == null) {
            self.foo = 10;
        } else {
            self.foo = 20;
        }
    }
}