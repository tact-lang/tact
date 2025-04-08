// Confirm structs allowed, but nested contract references disallowed so use struct instead
struct InnerStruct {
    val: Int;
}

contract OuterStructUse {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{ val:5 };
    }
}
