struct FieldOrderTest {
    a: Int as int8;
    b: Bool;
    c: String;
    d: Int as uint16;
    e: Bool;
}

contract OrderStructTest {
    data: FieldOrderTest;

    init() {
        self.data = FieldOrderTest{
            a: -5, b: true, c: "ok", d: 50000, e: false
        };
    }
}