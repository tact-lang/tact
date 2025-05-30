contract OptionalFieldMutation {
    foo: Int?;

    init() {
        self.foo = null;
    }
    
    receive() {
        self.foo = 5;
    }
}
