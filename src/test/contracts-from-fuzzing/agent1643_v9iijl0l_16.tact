contract DuplicateNamesContract {
    foo: Int;
    
    init() {
        self.foo = 1;
    }
    
    receive() {
        self.foo = 2;
    }
}
