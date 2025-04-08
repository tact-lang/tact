struct InnerMost {
    x: Int;
    y: Bool;
}

struct InnerMid {
    i1: InnerMost;
    z: Int;
}

struct Outer {
    im: InnerMid;
    extra: Bool;
}

contract ThreeLevelNested {
    val: Outer;

    init() {
        self.val = Outer{
            im: InnerMid{
                i1: InnerMost{
                    x: 99,
                    y: true,
                },
                z: 42,
            },
            extra: false,
        };
    }
}