struct Inner {
    foo: Int;
}

contract DoubleAssign {
    a: Inner;
    b: Inner;

    init() {
        self.a = Inner{foo:1};
        self.b = Inner{foo:2};
    }
}