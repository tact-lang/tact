struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestInit {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 7,
            b: true,
            c: null,
        };
    }
}
