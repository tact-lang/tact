struct OptionalNested {
    nestedOpt: Inner?;
}

struct Inner {
    text: String;
    flag: Bool;
}

contract TestContract {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{
            nestedOpt: Inner{
                text: "hi",
                flag: false,
            },
        };
    }
}
