struct Inner {
    a: Int?;
    b: Bool;
}

contract NestedOpt {
    field: Inner;

    init() {
        self.field = Inner{
            a: null,
            b: true,
        };
    }
}