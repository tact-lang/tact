struct NestedOpt {
    a: Int?;
    b: InnerOpt;
}

struct InnerOpt {
    x: Int?;
    y: Int?;
}

contract Test {
    nestedOpt: NestedOpt;

    init() {
        self.nestedOpt = NestedOpt{a: null, b: InnerOpt{x: null, y: null}};
    }
}