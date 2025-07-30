struct MidLevel {
    a: Int;
    b: Bool?;
    c: String;
}

struct Top {
    m1: MidLevel?;
    m2: MidLevel?;
}

contract NestedOpts {
    z: Top?;

    init() {
        self.z = null;
    }
}