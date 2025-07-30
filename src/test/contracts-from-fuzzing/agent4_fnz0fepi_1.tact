contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Valid getter: simply reading state, as per documentation 
    get fun getFoo(): Int {
        return self.foo;
    }
}
