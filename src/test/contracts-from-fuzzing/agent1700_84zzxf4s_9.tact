struct ContainsOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
}

contract StructOptFields {
    data: ContainsOptionals;

    init() {
        self.data = ContainsOptionals{
            a: 10,
            b: false,
            c: "some text",
            d: emptyCell().asSlice(),
            e: emptyCell()
        };
    }
}
