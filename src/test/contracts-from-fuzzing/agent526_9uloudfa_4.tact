struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptionalsTest {
    optData: OptionalFields;

    init() {
        self.optData = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null,
        };
    }

    receive() {}
}