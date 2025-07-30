struct DeepInner {
    value: Int;
    note: String?;
}

struct Mid {
    flag: Bool;
    deepInner: DeepInner;
}

struct Top {
    count: Int;
    middle: Mid;
}

contract NestedStructs {
    data: Top;

    init() {
        self.data = Top{
            count: 3,
            middle: Mid{
                flag: false,
                deepInner: DeepInner{
                    value: 11,
                    note: null,
                },
            },
        };
    }
}