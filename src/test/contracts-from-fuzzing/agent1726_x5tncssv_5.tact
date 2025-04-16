struct NestedOpt {
    inner: Int?;
}

struct OuterWithOpt {
    wrap: NestedOpt?;
    flag: Bool;
}

contract OptionalDeep {
    s: OuterWithOpt;

    init() {
        self.s = OuterWithOpt{
            wrap: null,
            flag: true,
        };
    }
}