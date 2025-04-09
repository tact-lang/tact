struct Tiny {
    a: Int as uint4;
    b: Bool;
    c: Int as int3;
}

contract SmallSerial {
    s: Tiny;

    init() {
        self.s = Tiny{
            a: 5,
            b: true,
            c: -2,
        };
    }
}