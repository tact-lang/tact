contract G {
    foo: Int;

    init() {
        self.foo = 10;
    }

    // Getter function that modifies the state variable
    get fun incre(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
