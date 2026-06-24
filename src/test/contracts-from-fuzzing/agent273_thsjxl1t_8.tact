struct BoolNest {
    x: Bool;
    y: Bool;
    z: Bool;

    sub: InnerBool;
}

struct InnerBool {
    p: Bool;
    q: Bool;
}

contract Test8 {
    data: BoolNest;

    init() {
        self.data = BoolNest{ x: true, y: false, z: true, sub: InnerBool{ p: false, q: true } };
    }
}