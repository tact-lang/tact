struct NestedOptionalSerialization {
    x: Int? as uint8;
    y: Int? as int64;
}

contract OptionalNestedSerialization {
    d: NestedOptionalSerialization;

    init() {
        self.d = NestedOptionalSerialization{
            x: null,
            y: null
        };
    }
}