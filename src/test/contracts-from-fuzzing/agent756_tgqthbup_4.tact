struct ManyOptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestOptional {
    optData: ManyOptionalFields;

    init() {
        self.optData = ManyOptionalFields{
            a: 1,
            b: "hi",
            c: true,
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}