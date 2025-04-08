struct NestedOpt {
    inner: Int?;
}

struct ContainsNestedOpt {
    nested: NestedOpt?;
    flag: Bool;
}

contract ManyOpts {
    store: ContainsNestedOpt;
    init() {
        self.store = ContainsNestedOpt{
            nested: null,
            flag: true,
        };
    }
}