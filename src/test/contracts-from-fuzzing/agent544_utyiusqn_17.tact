struct SerializeA {
    a: Int as uint8;
    b: Int as int8;
}
struct SerializeB {
    c: SerializeA;
    d: Int as uint16;
    e: Int as int16;
}

contract TestContract {
    s: SerializeB;

    init() {
        self.s = SerializeB{
            c: SerializeA{
                a: 250,
                b: -120,
            },
            d: 65000,
            e: -30000,
        };
    }
}