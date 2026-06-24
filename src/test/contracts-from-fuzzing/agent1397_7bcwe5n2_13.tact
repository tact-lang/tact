struct ManyBooleans {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

contract TestContract {
    flags: ManyBooleans;

    init() {
        self.flags = ManyBooleans{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true,
            f: false,
            g: true,
            h: false,
            i: true,
            j: false,
        };
    }

    receive() {
        let _ = self.flags.a;
        let _ = self.flags.j;
    }
}