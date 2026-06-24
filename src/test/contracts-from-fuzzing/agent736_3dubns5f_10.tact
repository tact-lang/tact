struct NestedOptionalStruct {
    o1: Inner?;
    o2: Inner?;
}

struct Inner {
    i1: Int;
    i2: String;
}

contract NestedOptionalVars {
    field: NestedOptionalStruct;

    init() {
        self.field = NestedOptionalStruct{ o1: null, o2: null };
    }
}