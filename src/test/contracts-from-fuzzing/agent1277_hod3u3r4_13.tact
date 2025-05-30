struct FieldOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OrderTest {
    storage: FieldOrder;

    init() {
        self.storage = FieldOrder {
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null,
            f: null,
        };
    }
}
