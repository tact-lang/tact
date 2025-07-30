contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 0;
    }

    get fun foo(): Int {
        self.foo = 123;
        return self.foo;
    }
}
