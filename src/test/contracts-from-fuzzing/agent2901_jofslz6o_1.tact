struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    nested: Inner;
    
    init() {
        self.nested = Inner{a: 1, b: true};
    }
}