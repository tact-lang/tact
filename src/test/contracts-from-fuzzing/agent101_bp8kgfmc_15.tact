struct LeafX { q: Int; }

struct RootX {
    p: Int?;
    child: LeafX?;
}

contract DefaultSomeOpt {
    data: RootX = RootX{
        p: null,
        child: LeafX{ q: 123 },
    };

    init() {
        self.data = RootX{
            p: 42,
            child: null,
        };
    }
}