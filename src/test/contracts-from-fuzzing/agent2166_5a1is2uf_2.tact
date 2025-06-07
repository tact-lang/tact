struct DeepNested {
    val: Int;
    flag: Bool;
}

struct MiddleNested {
    deep: DeepNested;
    comment: String;
}

struct OuterNested {
    mid: MiddleNested;
    amount: Int;
}

contract DeepNestedFields {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            mid: MiddleNested{
                deep: DeepNested{val: 1, flag: true},
                comment: "ok"
            },
            amount: 10
        };
    }
}
