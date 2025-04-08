struct ManyOptBools {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;
}

contract TestContract {
    flags: ManyOptBools;

    init() {
        self.flags = ManyOptBools{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null
        };
    }
}