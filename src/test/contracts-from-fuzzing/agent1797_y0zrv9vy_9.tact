struct NestedOptionalStruct {
    inner: OptionalInner;
}

struct OptionalInner {
    val: Int?;
}

contract Test {
    f: NestedOptionalStruct;
    init() {
        self.f = NestedOptionalStruct{ inner: OptionalInner{ val: null } };
    }
}