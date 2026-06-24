struct Inner {
    a: Int;
    b: Int?;
}

contract TestContract {
    foo: Inner;

    init() {
        self.foo = Inner{
            a: 1,
            b: null,
        };
    }
}