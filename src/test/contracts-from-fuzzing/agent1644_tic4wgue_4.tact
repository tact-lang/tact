struct LotsOfBools {
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
    flags: LotsOfBools;

    init() {
        self.flags = LotsOfBools{
            a: false, b: false, c: false, d: false, e: false,
            f: false, g: false, h: false, i: false, j: false
        };
    }
}