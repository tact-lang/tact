struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    foo: Inner;
    
    init() {
        self.foo = Inner{
            a: 1,
            b: true,
        };
    }
}