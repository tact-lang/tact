struct OptionalDeep {
    inner: OptionalDeeper?;
}

struct OptionalDeeper {
    value: Int;
    flag: Bool;
}

contract NullableDeepVar {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep {
            inner: null
        };
    }
}
