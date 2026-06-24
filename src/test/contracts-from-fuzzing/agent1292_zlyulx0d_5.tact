struct NestedOpt {
    inner: String?;
}

struct OuterOpt {
    nested: NestedOpt?;
    flag: Bool;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null,
            flag: false,
        };
    }
}