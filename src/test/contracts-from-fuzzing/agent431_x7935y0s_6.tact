struct ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: String?;
}

contract OptionalPrimitives {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: null,
            b: 1,
            c: true,
            d: null,
            e: null,
            f: null,
            g: "hello",
        };
    }

    receive() {}
}