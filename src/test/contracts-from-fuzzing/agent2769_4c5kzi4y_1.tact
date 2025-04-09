struct InnerLevel {
    flag: Bool;
    text: String;
    amount: Int?;
}

struct MiddleLevel {
    inner: InnerLevel;
    count: Int;
}

struct OuterLevel {
    middle: MiddleLevel;
    note: String;
}

contract DeepStructTest {
    info: OuterLevel;

    init() {
        self.info = OuterLevel{
            middle: MiddleLevel{
                inner: InnerLevel{
                    flag: true,
                    text: "deep",
                    amount: 10,
                },
                count: 42,
            },
            note: "done",
        };
    }
}