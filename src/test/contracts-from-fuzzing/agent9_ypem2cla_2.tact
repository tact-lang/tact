contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 0;
    }

    get fun foo(): Int {
        self.foo = 1; // modifying state variable in a getter
        return self.foo;
    }
}
