contract Test {
    foo: Int = 1;

    get fun getFoo(): Int {
        return self.foo;
    }

    receive() {
        self.foo += 1;
    }
}