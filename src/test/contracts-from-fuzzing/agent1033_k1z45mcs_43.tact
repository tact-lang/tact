struct InnerStruct {
    s: String?;
}

struct OuterStruct {
    inner: InnerStruct;
}

contract NestedOptionalStr {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{ inner: InnerStruct{ s: null } };
    }
}