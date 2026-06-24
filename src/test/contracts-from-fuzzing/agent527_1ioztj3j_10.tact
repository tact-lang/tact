struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct TopWithNestedDefaults {
    inner: NestedDefaults;
    other: Int;
}

contract DefaultsInNestedStructs {
    field: TopWithNestedDefaults;
    init() {
        self.field = TopWithNestedDefaults{
            inner: NestedDefaults{},
            other: 42,
        };
    }
}