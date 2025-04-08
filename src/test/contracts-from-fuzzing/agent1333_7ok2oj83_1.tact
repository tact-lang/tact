struct DeepNested {
    value: Int;
}

struct MiddleNested {
    inner: DeepNested;
    flag: Bool;
}

struct TopNested {
    middle: MiddleNested;
    text: String;
}

contract DeepTest {
    data: TopNested;

    init() {
        self.data = TopNested{
            middle: MiddleNested{
                inner: DeepNested{ value: 123 },
                flag: false
            },
            text: "abc"
        };
    }
}