struct DeeplyOptional {
    inner: OptionalInner?;
}

struct OptionalInner {
    val: Int? = null;
}

contract NestedDefaultNulls {
    nested: DeeplyOptional;

    init() {
        self.nested = DeeplyOptional {
            inner: null
        };
    }
}
