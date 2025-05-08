struct MiddleNested {
    innerOpt: Inner?;
    flag: Bool;
}

struct Inner {
    val: Int;
    text: String;
}

struct TopNested {
    middle: MiddleNested;
    outerVal: Int;
}

contract NestedOptionalFields {
    store: TopNested;

    init() {
        self.store = TopNested{
            middle: MiddleNested{
                innerOpt: Inner{
                    val: 77,
                    text: "hi"
                },
                flag: true
            },
            outerVal: 123
        };
    }
}