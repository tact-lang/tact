struct InnerMost {
    z: Int?;
}
struct Inner {
    y: InnerMost?;
}
struct Outer {
    x: Inner?;
}

contract NestedThreeOpt {
    f: Outer;
    init() {
        self.f = Outer{x: null};
    }
}