struct NestedWithOptionals {
    s1: InnerWithOpt;
    s2: InnerWithOpt?;
}

struct InnerWithOpt {
    x: Int;
    y: Int?;
    z: Bool?;
}

contract TestNestedOpts {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            s1: InnerWithOpt{ x: 10, y: null, z: true },
            s2: null,
        };
    }
}