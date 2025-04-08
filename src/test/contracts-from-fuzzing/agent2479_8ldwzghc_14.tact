struct Flags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
}

contract BoolPacked {
    f: Flags;
    init() {
        self.f = Flags{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true,
            f: false,
        };
    }
}