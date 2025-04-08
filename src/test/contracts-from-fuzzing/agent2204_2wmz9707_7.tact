struct InnerMost {
    val: Int;
}

struct MiddleOptional {
    inner: InnerMost?;
}

struct OuterOptional {
    mid: MiddleOptional?;
}

contract NestedOptionalFields {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{
            mid: null
        };
    }
}