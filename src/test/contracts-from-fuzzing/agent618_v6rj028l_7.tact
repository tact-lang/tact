struct FieldOrderTest {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;
    d: String;
    e: Int;
    f: Bool?;
}

contract OrderContract {
    s: FieldOrderTest;

    init() {
        self.s = FieldOrderTest{
            a: 1,
            b: -100,
            c: true,
            d: "field",
            e: 999,
            f: null
        };
    }
}
