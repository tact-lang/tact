struct LeafStruct {
    a: Int;
}

struct MiddleStruct {
    l1: LeafStruct;
    l2: Bool?;
}

struct RootStruct {
    m: MiddleStruct;
}

contract OptionalDeeper {
    root: RootStruct;

    init() {
        self.root = RootStruct{
            m: MiddleStruct{
                l1: LeafStruct{ a: 1 },
                l2: null,
            },
        };
    }
}