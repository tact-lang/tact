contract NestedDefaultOpt {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{};
    }
}

struct NestedOpt {
    n: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    flag: Bool?;
}
