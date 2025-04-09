struct DeepNested {
    content: String;
    number: Int;
}

struct MiddleNested {
    nested: DeepNested;
    flag: Bool;
}

contract DeepNestedContract {
    state: MiddleNested;

    init() {
        self.state = MiddleNested{
            nested: DeepNested{
                content: "abc",
                number: 77
            },
            flag: false
        };
    }
}