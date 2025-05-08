struct Inner {
    a: Int;
    b: String?;
}

contract BasicNestedOpt {
    s: Inner;

    init() {
        self.s = Inner{
            a: 1,
            b: null
        };
    }
}