struct SimpleNested {
    flag: Bool;
    nested: InnerStruct;
}

struct InnerStruct {
    value: Int;
    message: String;
}

contract NestedStructTest {
    data: SimpleNested;

    init() {
        self.data = SimpleNested{
            flag: true,
            nested: InnerStruct{
                value: 2024,
                message: "Hello"
            }
        };
    }
}