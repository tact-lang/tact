struct ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract TestManyOptionalFields {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "abc",
            f: null,
        };
    }
}
