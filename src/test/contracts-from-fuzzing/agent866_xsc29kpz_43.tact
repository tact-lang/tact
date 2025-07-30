contract DifferentTypes {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;
    
    init() {
        self.foo=1;
        self.bar=true;
        self.baz="test";
        self.qux=myAddress();
    }
}