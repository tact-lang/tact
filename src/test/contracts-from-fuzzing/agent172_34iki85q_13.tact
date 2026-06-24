struct Flags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

struct Globals {
    f: Flags;
    count: Int as uint4;
}

contract PackedBits {
    globals: Globals;

    init() {
        self.globals = Globals{
            f: Flags{
                a: true,
                b: false,
                c: true,
                d: false,
            },
            count: 12,
        };
    }
}