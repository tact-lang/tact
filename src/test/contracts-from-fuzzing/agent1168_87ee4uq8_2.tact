struct InnerLevel {
    num: Int;
    text: String;
    flag: Bool;
}

struct MiddleLevel {
    inner: InnerLevel;
    optionalInt: Int?;
    optionalStr: String?;
}

struct OuterLevel {
    middle: MiddleLevel;
    extra: Int;
}

contract DeepNestedContract {
    storage: OuterLevel;

    init() {
        self.storage = OuterLevel{
            middle: MiddleLevel{
                inner: InnerLevel{
                    num: 1,
                    text: "hi",
                    flag: true
                },
                optionalInt: null,
                optionalStr: null
            },
            extra: 99
        };
    }
}