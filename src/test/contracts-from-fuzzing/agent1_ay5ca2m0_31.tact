contract NestedOptWithVals {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            nested: InnerOpt{
                value: 42,
                flag: false
            }
        };
    }
}

struct OuterOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    value: Int;
    flag: Bool;
}
