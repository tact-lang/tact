contract TestContract {
    foo: Int = 0;

    init() {
        self.foo = 10;
    }

    get fun getFoo(): Int {
        return self.foo;
    }
}