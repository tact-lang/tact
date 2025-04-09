struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
    flag: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            im: InnerMost{
                x: 123,
            },
            flag: true,
        };
    }
}