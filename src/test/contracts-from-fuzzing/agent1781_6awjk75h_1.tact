contract TestDeepNested {
    a: NestedOuter;

    init() {
        self.a = NestedOuter{
            level1: NestedInner{
                level2: DeepInner{
                    value: 123,
                    flag: true,
                    optNum: null
                },
                text: "hi"
            },
            count: 42
        };
    }
}

struct NestedOuter {
    level1: NestedInner;
    count: Int;
}

struct NestedInner {
    level2: DeepInner;
    text: String;
}

struct DeepInner {
    value: Int;
    flag: Bool;
    optNum: Int?;
}