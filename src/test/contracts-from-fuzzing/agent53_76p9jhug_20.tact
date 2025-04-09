struct Flags {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
    e: Bool = true;
    f: Bool = false;
    g: Bool = true;
    h: Bool = false;
    i: Bool = true;
    j: Bool = false;
}

contract BoolBag {
    flags: Flags;
    init() {
        self.flags = Flags{};
    }
}