struct AllBool {
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
    flags: AllBool;
    init() {
        self.flags = AllBool{
            a: true, b: false, c: true, d: true, e: false,
            f: false, g: true, h: false, i: true, j: true
        };
    }
}