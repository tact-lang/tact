struct NestedOptionalStruct {
    nested: InnerOptStruct?;
}

struct InnerOptStruct {
    x: Int;
    y: Bool;
}

contract TestOptionalStruct {
    n: NestedOptionalStruct?;

    init() {
        self.n = null;
    }
}