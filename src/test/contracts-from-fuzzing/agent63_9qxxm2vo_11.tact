struct CustomSer {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializeTest {
    s: CustomSer;

    init() {
        self.s = CustomSer{
            a: 1,
            b: -2,
            c: 300,
            d: -40000
        };
    }
}