struct Base {
    innerOpt: Inner?;
}

struct Inner {
    text: String;
    flag: Bool?;
}

contract CombinedNested {
    state: Base;

    init() {
        self.state = Base{
            innerOpt: Inner{
                text: "hello",
                flag: null,
            },
        };
    }
}