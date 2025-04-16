struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract Test {
    inner: NestedOpt;

    init() {
        self.inner = NestedOpt{
            a: null,
            b: true,
            c: null,
        };
    }
}
