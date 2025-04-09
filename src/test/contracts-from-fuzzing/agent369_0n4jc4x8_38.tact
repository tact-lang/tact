contract MixedDefaultsOptionals {
    foo: Int = 1;
    bar: Int?;
    baz: Bool?;
    qux: Int = 42;
    
    init() {
        self.foo = 5;
        self.bar = null;
        self.baz = null;
        self.qux = 99;
    }
}