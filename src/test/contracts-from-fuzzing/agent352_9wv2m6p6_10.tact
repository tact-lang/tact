struct OptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Builder?;
}

contract Test {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: null,
            c: true,
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}