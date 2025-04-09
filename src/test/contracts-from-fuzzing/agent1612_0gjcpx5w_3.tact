struct DeepInner {
    val: Int;
    ok: Bool;
}

struct Outer {
    nested: DeepInner;
    note: String;
    maybeVal: Int?;
}

contract DeepNestedStorage {
    field: Outer;

    init() {
        self.field = Outer{
            nested: DeepInner{
                val: 42,
                ok: true,
            },
            note: "hello",
            maybeVal: null,
        };
    }
}
