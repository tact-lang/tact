struct NestedOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct TopOpt {
    x: NestedOpt?;
}

contract OptionalInsideOptional {
    s: TopOpt;
    init() {
        self.s = TopOpt{
            x: NestedOpt{
                f1: null,
                f2: null,
                f3: null,
            },
        };
    }
}