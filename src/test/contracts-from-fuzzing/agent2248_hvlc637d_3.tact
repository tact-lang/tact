struct Inner {
    enabled: Bool;
    amount: Int?;
}

struct Outer {
    inner: Inner;
    label: String;
}

contract DeepOptional {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                enabled: false,
                amount: null,
            },
            label: "test",
        };
    }
}