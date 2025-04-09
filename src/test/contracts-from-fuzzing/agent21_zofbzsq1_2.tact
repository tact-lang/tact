contract TestGetter {
    foo: Int;

    init() {
        self.foo = 1;
    }

    // Getter function that attempts to modify the state; documentation says modifications should not be allowed
    get fun alterFoo() : Int {
        self.foo = 99; // modifying state variable inside getter
        return self.foo;
    }
}
