struct Packet {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Int as coins;
}

contract Test {
    p: Packet;

    init() {
        self.p = Packet{
            a:255,
            b:-32000,
            c:123456,
            d:ton("5"),
        };
    }
}
