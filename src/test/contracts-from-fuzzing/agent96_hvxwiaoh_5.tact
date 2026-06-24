struct InnerOpt {
    alpha: Int?;
    beta: Bool;
}

struct OuterOpt {
    inner: InnerOpt?;
    gamma: String;
}

contract NestedOptionals {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                alpha: 42,
                beta: true,
            },
            gamma: "test",
        };
    }

    receive() {}
}