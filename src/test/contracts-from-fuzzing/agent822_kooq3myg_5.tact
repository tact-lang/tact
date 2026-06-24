struct Param {
    x: Int;
    y: String?;
    z: Bool;
}

struct Outer {
    p1: Param;
    p2: Param;
    p3: Param;
}

contract TestContract {
    full: Outer;

    init() {
        self.full = Outer{
            p1: Param{ x:1, y: null, z: true },
            p2: Param{ x:2, y: "x", z: false },
            p3: Param{ x:3, y: null, z: true },
        };
    }
}
