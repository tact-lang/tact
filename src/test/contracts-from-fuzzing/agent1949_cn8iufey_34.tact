struct InA {
    x: Int;
    y: Bool;
}

struct InB {
    a: Int;
    b: InA;
}

struct InC {
    s: InB;
    q: String?;
    m: InA?;
}

contract DeepOpts {
    v: InC?;

    init() {
        self.v = null;
    }
}
