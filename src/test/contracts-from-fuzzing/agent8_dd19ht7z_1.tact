contract TestGetter {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Getter function that modifies state variable
    get fun badGetter(): Int {
         self.foo = 99;
         return self.foo;
    }
}
