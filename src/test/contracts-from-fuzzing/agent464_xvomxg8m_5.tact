struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptionalsTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}
