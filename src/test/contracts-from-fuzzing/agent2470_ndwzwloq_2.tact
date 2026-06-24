struct DeepInner {
    val: Int;
    note: String;
}

struct MidLevel {
    a: DeepInner;
    b: Int?;
}

struct Outer {
    nested: MidLevel;
    flag: Bool;
}

contract NestedContract {
    state: Outer = Outer{
        nested: MidLevel{
            a: DeepInner{
                val: 0,
                note: "",
            },
            b: null,
        },
        flag: false,
    };
}