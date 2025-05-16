// Struct with Struct containing optional
struct WrappedOpt {
    inner: Int?;
}

struct SWrapper {
    val: WrappedOpt;
}

contract NestedOptionalInsideStruct {
    field: SWrapper;
    init() {
        self.field = SWrapper{ val: WrappedOpt{ inner: null } };
    }
}