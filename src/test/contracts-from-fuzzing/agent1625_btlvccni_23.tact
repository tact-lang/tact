struct Embedded {
    x: Int;
}

struct Wrap1 {
    e: Embedded;
}

struct Wrap2 {
    w: Wrap1;
}

struct Wrap3 {
    z: Wrap2;
}

contract TripleWrap {
    dat: Wrap3;

    init() {
        self.dat = Wrap3{ z: Wrap2{ w: Wrap1{ e: Embedded{ x: 7 } } } };
    }
}
