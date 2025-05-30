struct P {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Q {
    p: P;
}

struct R {
    q: Q;
}

contract Test {
    r: R;

    init() {
        self.r = R{ q: Q{ p: P{ x: null, y: null, z: null } } };
    }
}