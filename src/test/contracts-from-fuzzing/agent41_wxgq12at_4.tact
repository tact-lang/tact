struct DeepInner {
    x: Int;
    y: Int;
}

struct MiddleLayer {
    deep: DeepInner;
    note: String;
}

struct OuterLayer {
    mid: MiddleLayer;
    valid: Bool;
}

contract DeeplyNestedStructs {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            mid: MiddleLayer{
                deep: DeepInner{
                    x: 1,
                    y: 2,
                },
                note: "hi",
            },
            valid: true,
        };
    }
}
