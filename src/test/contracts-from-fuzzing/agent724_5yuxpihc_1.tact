struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    foo: Inner;
    
    init() {
        self.foo = Inner{a: 1, b: "hi", c: null};
    }
}
