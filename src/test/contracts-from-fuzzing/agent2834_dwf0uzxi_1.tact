struct InnerLevel {
    number: Int;
    flag: Bool;
}

struct OuterLevel {
    nested: InnerLevel;
    text: String;
    optionalNum: Int?;
}

contract DeepNestTest {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            nested: InnerLevel{ number: 123, flag: true },
            text: "hello",
            optionalNum: null
        };
    }
}