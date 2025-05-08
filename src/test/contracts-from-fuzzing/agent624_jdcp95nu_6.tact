struct OptionalNest {
    o1: Int?;
    o2: String?;
    s: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    num: Int;
}

contract OptionalStorage {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            o1: null,
            o2: null,
            s: null,
        };
    }
}
