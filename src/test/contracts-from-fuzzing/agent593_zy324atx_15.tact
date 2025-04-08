// Struct with many booleans to test tight packing
struct Flags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract PackedBools {
    flagset: Flags = Flags{
        a: true,
        b: false,
        c: true,
        d: true,
        e: false,
        f: false,
        g: true,
        h: false,
    };
    init() {}
}