struct Base {
    f1: Int;
    f2: Bool?;
    f3: String?;
}

struct Middle {
    x: Int;
    base: Base;
    y: Int?;
}

struct Top {
    mid: Middle;
    z: Bool;
}

contract NestedMix {
    data: Top;
    init() {
        self.data = Top{
            mid: Middle{
                x: 5,
                base: Base{ f1:1, f2:null, f3:null },
                y: null
            },
            z: true,
        };
    }
}
