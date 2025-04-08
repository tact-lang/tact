struct Tiny {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Bool;
    e: Bool;
}

contract TinyStorage {
    mini: Tiny;

    init() {
        self.mini = Tiny{
            a: 5,
            b: 255,
            c: 65535,
            d: true,
            e: false
        };
    }
}