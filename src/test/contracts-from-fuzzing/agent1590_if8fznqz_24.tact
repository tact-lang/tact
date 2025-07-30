struct Small {
    a: Int as uint16;
    b: Int;
}

struct Larger {
    s: Small;
    extra: Bool;
}

contract NestSerial {
    st: Larger;
    init() {
        self.st = Larger{
            s: Small{
                a: 100,
                b: 1000
            },
            extra: false
        };
    }
}