struct InnerMost {
    flag: Bool;
    amount: Int?;
}

struct Inner {
    nested: InnerMost;
    anotherFlag: Bool?;
}

struct Outer {
    inner: Inner;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                nested: InnerMost{
                    flag: true,
                    amount: null,
                },
                anotherFlag: false,
            },
            text: "Hello",
        };
    }
}
