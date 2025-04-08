struct Inner {
    bar: Int;
    baz: Bool?;
}

contract Test {
    foo: Inner;
    
    init() {
        self.foo = Inner{bar: 7, baz: null};
    }
}