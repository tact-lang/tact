struct X {
    y: Int?;
}

contract PersistDefaultedOpt {
    foo: X?;
    bar: Int;
    
    init() {
        self.foo = null;
        self.bar = 123;
    }
}