struct SDeep {
    nested: SDeeper;
}

struct SDeeper {
    x: Int;
    y: SDeeper2;
}

struct SDeeper2 {
    z: String;
}

contract TestContract {
    f: SDeep;

    init() {
        self.f = SDeep{ nested: SDeeper{ x:1, y:SDeeper2{z:"a"} } };
    }

    receive() {
        self.f = SDeep{ nested: SDeeper{ x:2, y:SDeeper2{z:"b"} } };
    }
}