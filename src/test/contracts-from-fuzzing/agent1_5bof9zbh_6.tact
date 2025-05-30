contract GetterModify {
    foo: Int;
    
    init() {
        self.foo = 0;
    }

    // Getter that attempts to modify state. Although docs say getters should only read state variables,
    // in practice modifications here are allowed but do not persist across TVM runs.
    get fun incFoo(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
