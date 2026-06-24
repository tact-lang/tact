struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    param: Inner;

    init() {
        self.param = Inner{foo: 1, bar: true};
    }
    
    receive() {
        // Access to nested struct's fields
        let _ = self.param.foo;
    }
}