struct NestedOpt {
    i: Int?;
}

struct OuterOpt {
    s: NestedOpt?;
}

contract DoubleNestedOptionals {
    field: OuterOpt;

    init() {
        self.field = OuterOpt {
            s: null
        };
    }
}