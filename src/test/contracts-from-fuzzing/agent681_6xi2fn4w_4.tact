struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    s: Slice?;
    str: String?;
}

contract OptionalNested {
    field: OptionalFields;

    init() {
        self.field = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            s: null,
            str: "optional"
        };
    }
}
