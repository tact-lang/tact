struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalFields {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}