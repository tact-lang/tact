struct OptionalDeepInner {
    val: Int;
}

struct OptionalDeepOuter {
    nested: OptionalDeepInner?;
}

contract OptionalDeepNestedField {
    field: OptionalDeepOuter?;

    init() {
        self.field = null;
    }
}
