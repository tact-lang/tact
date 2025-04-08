struct DeepNested {
    val: Int;
    opt: Int?;
}

struct MidNested {
    deep: DeepNested;
    flag: Bool;
}

struct TopNested {
    mid: MidNested;
    message: String;
}

contract NestedFields {
    data: TopNested;

    init() {
        self.data = TopNested{
            mid: MidNested{
                deep: DeepNested{
                    val: 123,
                    opt: null
                },
                flag: true
            },
            message: "hello"
        };
    }
}