struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract OptionalsContract {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: 1,
            b: null,
            c: "hello",
            d: null,
            e: null,
        };
    }
}
