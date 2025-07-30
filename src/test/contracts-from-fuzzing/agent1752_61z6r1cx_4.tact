struct OptionalFields {
    x: Int?;
    y: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;
}

contract OptFieldsTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: true,
            s: null,
            c: null,
            sl: null,
            addr: null,
        };
    }
}