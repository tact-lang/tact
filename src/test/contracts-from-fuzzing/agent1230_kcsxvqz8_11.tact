struct NestedLargeA {
    q: Int;
    r: Int;
    s: Int;
    t: Int;
}

struct NestedLargeB {
    x: Int;
    y: Int;
    z: NestedLargeA;
}

contract NestedHugeStructContract {
    f: NestedLargeB;

    init() {
        self.f = NestedLargeB{
            x:1, y:2, z: NestedLargeA{ q:3, r:4, s:5, t:6 }
        };
    }
}