struct FieldsOrdering {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
}

contract FieldOrderTest {
    s: FieldsOrdering;
    init() {
        self.s = FieldsOrdering{
            a: 1,
            b: true,
            c: "x",
            d: 2,
            e: false,
        };
    }
}