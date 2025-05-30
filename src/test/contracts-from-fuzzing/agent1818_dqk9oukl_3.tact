struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: "hello",
            d: null,
            e: null,
            f: null,
        };
    }
}
