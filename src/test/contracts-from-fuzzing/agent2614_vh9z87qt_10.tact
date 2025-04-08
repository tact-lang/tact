struct DeeplyNested {
    s1: String;
    s2: String;
}

struct MiddleLayer {
    deep: DeeplyNested;
    number: Int;
}

struct TopLayer {
    inner: MiddleLayer;
    flag: Bool;
}

contract MultiNestedStructs {
    storage: TopLayer;

    init() {
        self.storage = TopLayer{
            inner: MiddleLayer{
                deep: DeeplyNested{
                    s1: "a",
                    s2: "b"
                },
                number: 42
            },
            flag: true
        };
    }
}