struct DeepNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

struct MidNested {
    fieldA: Int;
    deep: DeepNested;
    flag: Bool;
}

struct TopNested {
    mid: MidNested;
    name: String;
    status: Bool;
}

contract DeepNestedStruct {
    data: TopNested;

    init() {
        self.data = TopNested{
            mid: MidNested {
                fieldA: 5,
                deep: DeepNested { inner1: 1, inner2: true, inner3: "hello" },
                flag: false,
            },
            name: "world",
            status: true,
        };
    }
}