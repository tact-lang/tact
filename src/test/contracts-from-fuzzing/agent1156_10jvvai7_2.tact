struct NestedOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract WithNestedOptional {
    data: NestedOptionalFields;

    init() {
        self.data = NestedOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}