struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: 5,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
        };
    }
}