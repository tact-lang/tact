struct NestedMulti {
    innerA: Int;
    innerB: Bool;
}

struct MidMulti {
    nest1: NestedMulti;
    nest2: NestedMulti;
}

struct OuterMulti {
    midA: MidMulti;
    midB: MidMulti;
}

contract MultiNest {
    data: OuterMulti;

    init() {
        self.data = OuterMulti{
            midA: MidMulti{
                nest1: NestedMulti{ innerA: 1, innerB: true },
                nest2: NestedMulti{ innerA: 2, innerB: false },
            },
            midB: MidMulti{
                nest1: NestedMulti{ innerA: 3, innerB: true },
                nest2: NestedMulti{ innerA: 4, innerB: false },
            },
        };
    }
}