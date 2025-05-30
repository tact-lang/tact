struct NestedOptionalWrap {
    a: Int?;
    b: Bool?;
}

struct HolderOptional {
    inner: NestedOptionalWrap?;
}

contract StructWithOptionalStruct {
    state: HolderOptional;

    init() {
        self.state = HolderOptional{
            inner: null,
        };
    }
}