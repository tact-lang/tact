struct InnerOne {
    score: Int = 100;
    label: String = "A";
    flag: Bool?;
}

struct MiddleOne {
    inner: InnerOne;
    title: String?;
}

struct OuterOne {
    middle: MiddleOne;
    amount: Int = 42;
}

contract DeepDefaults {
    data: OuterOne;

    init() {
        self.data = OuterOne{
            middle: MiddleOne{
                inner: InnerOne{
                    flag: true,
                },
                title: "Hi",
            },
            amount: 999,
        };
    }
}