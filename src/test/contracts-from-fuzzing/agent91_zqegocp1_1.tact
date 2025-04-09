struct Inner {
    a: Int;
    b: Int?;
}

contract Test {
    field: Inner;

    init() {
        self.field = Inner{
            a: 1,
            b: null,
        };
    }
}