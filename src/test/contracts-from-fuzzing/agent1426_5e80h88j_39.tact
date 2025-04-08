// Contract with nested struct with optionals and serialization modifiers
struct Limits {
    small: Int as uint4;
    mid: Int as int16;
    big: Int;
}

struct Opts {
    a: Limits?;
    b: Limits?;
}

contract NestedOptsSerial {
    s: Opts;

    init() {
        self.s = Opts{
            a: Limits{ small:1, mid:-10, big:1000 },
            b: null
        };
    }
}