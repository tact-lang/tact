struct InnerMost {
    detail: Int;
    info: String;
    flag: Bool;
}

struct Mid {
    level: Int;
    inner: InnerMost;
}

struct OuterMost {
    id: Int;
    name: String;
    mid: Mid;
}

contract MultiTypeNest {
    storage: OuterMost;

    init() {
        self.storage = OuterMost {
            id: 1,
            name: "root",
            mid: Mid {
                level: 2,
                inner: InnerMost {
                    detail: 3,
                    info: "innermost",
                    flag: false
                }
            }
        };
    }
}
