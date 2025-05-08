contract OptionalInitOnly {
    foo: Int?;
    
    init() {
        self.foo = null;
    }
}