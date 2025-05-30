contract TestGetterMod {
    foo: Int;
    
    init() {
        self.foo = 10;
    }

    // Getter function that modifies the state variable
    get fun inc(): Int {
        self.foo += 1;
        return self.foo;
    }
}
