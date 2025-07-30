struct WeirdLayout {
    a: Bool;
    b: Int as uint4;
    c: Bool;
    d: Int as int64;
    e: Int as uint1;
    f: Int;
}

contract LayoutTest {
    field: WeirdLayout;

    init() {
        self.field = WeirdLayout{
            a: true,
            b: 8,
            c: false,
            d: 1234567890,
            e: 1,
            f: 999,
        };
    }
}
