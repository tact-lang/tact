contract Test {
    foo: Int; 
    bar: Bool; 
    baz: Address;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
    }
}