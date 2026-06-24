contract HelloGetter {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter function that modifies a state variable
    get fun getFoo(): Int {
         self.foo = 42;
         return self.foo;
    }
}
