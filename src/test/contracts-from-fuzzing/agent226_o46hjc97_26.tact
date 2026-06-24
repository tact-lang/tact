struct NestedOptionalStruct {
    inner: Inner?;
}

struct Inner {
    val: Int?;
    flag: Bool?;
}

contract TestNestedOptStructs {
    s: NestedOptionalStruct;

    init() {
        self.s = NestedOptionalStruct {
            inner: Inner { val: null, flag: null }
        };
    }
}
