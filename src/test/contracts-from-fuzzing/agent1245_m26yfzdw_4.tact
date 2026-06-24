struct Inner {
    a: Int;
    b: Bool;
}

contract OptionalNested {
    opt: Inner?;

    init() {
        self.opt = Inner{
            a: 42,
            b: true,
        };
    }
}
