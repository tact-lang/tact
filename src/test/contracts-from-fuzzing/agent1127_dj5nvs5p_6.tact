struct HasOpt {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    next: Inner?;
}

struct Inner {
    v: Int;
    b: Bool;
}

contract Storage {
    field: HasOpt;

    init() {
        self.field = HasOpt{
            o1: 1,
            o2: null,
            o3: "hi",
            next: Inner{ v: 0, b: false },
        };
    }
}
