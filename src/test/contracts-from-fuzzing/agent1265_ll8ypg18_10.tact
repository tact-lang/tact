struct FieldsOrderTest {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
}
contract FieldOrder {
    test: FieldsOrderTest;
    init() {
        self.test = FieldsOrderTest{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hi",
            f: null,
            g: 7,
            h: false,
        };
    }
}