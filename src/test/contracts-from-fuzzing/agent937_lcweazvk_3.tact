struct DeepNested {
    inner1: Int;
    inner2: String;
    optionalInner: Bool?;
}

struct Level2 {
    nested: DeepNested;
    otherVal: String;
}

struct Level1 {
    l2: Level2;
    num: Int;
}

contract DeepNestedContract {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                nested: DeepNested{
                    inner1: 42,
                    inner2: "deep",
                    optionalInner: null,
                },
                otherVal: "middle",
            },
            num: 100,
        };
    }
}