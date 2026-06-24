struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    z: Inner?;
}

contract NestedOptOpt {
    f: Outer;
    init() {
        self.f = Outer{ z: null };
    }
}