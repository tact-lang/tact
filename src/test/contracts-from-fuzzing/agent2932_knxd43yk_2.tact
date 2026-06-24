struct DeepNested {
    val1: Int;
    val2: Bool;
}

struct MiddleNested {
    deep: DeepNested;
    flag: Bool;
}

struct TopLevel {
    middle: MiddleNested;
    num: Int;
}

contract NestedContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            middle: MiddleNested{
                deep: DeepNested{ val1: 10, val2: true },
                flag: false
            },
            num: 42
        };
    }
}