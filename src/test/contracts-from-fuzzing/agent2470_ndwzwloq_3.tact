struct DeepInner {
    val: Int;
    note: String;
}

struct MidLevel {
    a: DeepInner;
    opt: DeepInner?;
}

struct Outer {
    nested: MidLevel;
    flag: Bool;
}

contract DeepNestedOptional {
    state: Outer = Outer{
        nested: MidLevel{
            a: DeepInner{val: 0, note: ""},
            opt: null,
        },
        flag: true,
    };
}