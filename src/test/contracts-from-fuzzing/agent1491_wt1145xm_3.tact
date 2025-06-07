struct DeepNested {
    nested: Nested;
    ok: Bool;
}

struct Nested {
    foo: Int;
    bar: Bool;
}

contract DeepNestedStructField {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            nested: Nested{ foo: 10, bar: false },
            ok: true
        };
    }
}