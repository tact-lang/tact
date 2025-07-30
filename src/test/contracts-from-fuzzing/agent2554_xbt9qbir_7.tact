struct Sized {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Bool;
}

contract SizedStructTest {
    s: Sized;

    init() {
        self.s = Sized{
            a: 255,
            b: -32000,
            c: 4294967295,
            d: true
        };
    }
}