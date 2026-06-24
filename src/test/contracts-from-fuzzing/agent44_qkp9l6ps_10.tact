struct NestedWithOptional {
    inner: OptionalInner;
}

struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract NestedWithOptionalStruct {
    data: NestedWithOptional;

    init() {
        self.data = NestedWithOptional{
            inner: OptionalInner{
                a: null,
                b: null,
            }
        };
    }
}