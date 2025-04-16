contract OverlappingNames {
    foo: Int;
    bar: Int;
    
    init() {
        let foo = 10;
        let bar = 11;
        self.foo = foo;
        self.bar = bar;
    }
}