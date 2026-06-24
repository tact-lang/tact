struct OptNest {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct MidNest {
    first: OptNest;
    second: Int;
}

contract OptComplex {
    storage: MidNest;

    init() {
        self.storage = MidNest{
            first: OptNest{
                o1: null,
                o2: false,
                o3: "hi"
            },
            second: 77
        };
    }
}