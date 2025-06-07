contract InitDefaultTest {
    foo: Int;
    bar: Bool;
    init() {
        self.foo = 10;
        self.bar = false;
    }
    get fun getFoo(): Int {
        return self.foo;
    }
    receive() {
        self.foo = self.getFoo() + 1;
    }
}