struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;
    quux: Slice?;
    corge: String?;
}

contract OptionalStructStorage {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: null,
            bar: null,
            baz: null,
            qux: null,
            quux: null,
            corge: null,
        };
    }
}