struct DeepNested {
    val: Int;
    flag: Bool;
}

struct MiddleNested {
    deep: DeepNested;
    message: String;
}

contract DeepNestedContract {
    data: MiddleNested;

    init() {
        self.data = MiddleNested{
            deep: DeepNested{val: 5, flag: false},
            message: "hello"
        };
    }
}