struct NestedOpt {
    intOpt: Int?;
    boolOpt: Bool?;
}

struct Wrapper {
    nestedOpt: NestedOpt?;
}

contract NestedOptWrap {
    nested: Wrapper;

    init() {
        self.nested = Wrapper{ nestedOpt: null };
    }
}