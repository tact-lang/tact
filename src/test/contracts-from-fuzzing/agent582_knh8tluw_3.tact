struct Flags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract ManyBools {
    flags: Flags;

    init() {
        self.flags = Flags{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true
        };
    }
}
