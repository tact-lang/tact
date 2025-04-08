struct OptionalDeep {
    zz: NestedOpt?;
}

struct NestedOpt {
    xx: Bool;
    yy: InnerOpt?;
}

struct InnerOpt {
    value: Int;
    text: String?;
}

contract Test {
    store: OptionalDeep;

    init() {
        self.store = OptionalDeep{
            zz: null
        };
    }
}