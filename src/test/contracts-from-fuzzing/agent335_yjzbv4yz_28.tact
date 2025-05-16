struct NestedDefaultOptional {
    inner: Inner?;
}

struct Inner {
    x: Int = 7;
}

contract StructWithDefaultsToNull {
    field: NestedDefaultOptional;

    init() {
        self.field = NestedDefaultOptional{ inner: null };
    }
}