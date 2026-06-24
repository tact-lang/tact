struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract StructWithManyNullables {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: null,
            b: false,
            c: null,
            d: myAddress(),
            e: null,
            f: emptyCell().asSlice(),
        };
    }
}