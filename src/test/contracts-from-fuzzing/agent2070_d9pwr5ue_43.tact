struct FieldOrderTest {
    a: Int;
    b: String;
    c: Bool;
    d: Int as coins;
    e: String?;
    f: Bool?;
    g: Int?;
}

contract ContractOrder {
    f: FieldOrderTest;

    init() {
        self.f = FieldOrderTest{
            a: 17,
            b: "ordering",
            c: true,
            d: ton("1"),
            e: null,
            f: null,
            g: null
        };
    }
}