struct SInner {
    value: Int;
}

struct SMiddleOptional {
    nested: SInner?;
}

contract NestedNullableStruct {
    field: SMiddleOptional;

    init() {
        self.field = SMiddleOptional{nested: null};
    }
}