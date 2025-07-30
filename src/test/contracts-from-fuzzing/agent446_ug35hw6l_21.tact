struct NestedOpt {
    inner1: Int?;
    inner2: NestedInnerOpt?;
}

struct NestedInnerOpt {
    x: Int;
    y: Int?;
}

contract NestedOptional {
    store: NestedOpt;

    init() {
        self.store = NestedOpt {
            inner1: null,
            inner2: null
        };
    }
}