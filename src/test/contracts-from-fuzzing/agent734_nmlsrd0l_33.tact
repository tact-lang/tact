struct NestedSerFormats {
    a: Int as uint16;
    inner: InnerSer;
}

struct InnerSer {
    b: Int as int32;
    c: Int;
}

contract NestedSerFormatsTest {
    data: NestedSerFormats;

    init() {
        self.data = NestedSerFormats{
            a: 42,
            inner: InnerSer{
                b: -123,
                c: 999,
            }
        };
    }
}
