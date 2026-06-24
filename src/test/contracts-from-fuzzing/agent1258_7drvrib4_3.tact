struct InnerLevel {
    x: Int;
    y: Bool;
}

struct MiddleLevel {
    inner: InnerLevel;
    flag: Bool;
}

struct OuterLevel {
    middle: MiddleLevel;
    note: String;
}

contract DeepNestedStructs {
    content: OuterLevel;

    init() {
        self.content = OuterLevel{
            middle: MiddleLevel{
                inner: InnerLevel{ x: 10, y: true },
                flag: false
            },
            note: "hello"
        };
    }
}