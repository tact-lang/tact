struct Deepest {
    a: Int? as uint32;
    b: Bool?;
}

struct MiddleLevel {
    mid: Int as uint64;
    deep: Deepest;
}

contract MultiOptNest {
    s: MiddleLevel;

    init() {
        self.s = MiddleLevel{
            mid: 55,
            deep: Deepest{
                a: null,
                b: null
            }
        };
    }
}