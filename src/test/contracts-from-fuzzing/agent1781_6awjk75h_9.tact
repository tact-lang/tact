struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    number: Int;
    flag: Bool;
}

contract OptionalStructFieldVar {
    s: NestedOptionalStruct;

    init() {
        self.s = NestedOptionalStruct{ inner: null };
    }
}