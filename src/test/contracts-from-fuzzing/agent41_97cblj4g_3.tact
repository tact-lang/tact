contract Foo {
    foo: Int;

    init() {
        self.foo = 10;
    }

    // Getter function that modifies state (note: documentation claims this is not allowed though actually it compiles, and modifications are not persisted)
    get fun getFoo(): Int {
        self.foo = 20;
        return self.foo;
    }
}
