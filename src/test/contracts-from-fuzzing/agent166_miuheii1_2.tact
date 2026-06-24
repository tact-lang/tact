struct Inner {
    deepVal: Int;
    optBool: Bool?;
}

struct Middle {
    nested: Inner;
    flag: Bool;
    val: Int;
}

struct Outer {
    level: Middle;
    note: String;
}

contract DeepNestTest {
    field: Outer;

    init() {
        self.field = Outer{
            level: Middle{
                nested: Inner{
                    deepVal: 42,
                    optBool: null,
                },
                flag: true,
                val: 17,
            },
            note: "deep nesting",
        };
    }
}