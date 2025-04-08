contract TestPrimitives {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "hello";
    
    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = "world";
    }
}