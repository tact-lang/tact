struct Reordered {
    a: Int as uint8;
    b: Bool;
    c: Int as int16;
    d: Bool;
    e: Int;
}

contract SerializeKinds {
    s: Reordered;

    init() {
        self.s = Reordered{
            a: 255,
            b: true,
            c: -12345,
            d: false,
            e: 987654321
        };
    }
}