struct UnionFields {
    foo: Int?;
    bar: Bool;
    baz: String?;
}

contract OptMix {
    data: UnionFields;

    init() {
        self.data = UnionFields{
            foo: null,
            bar: true,
            baz: null
        };
    }
}
