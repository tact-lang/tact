struct InnerS {
    a: Int;
    b: Bool;
}

struct WithOption {
    f: InnerS?;
}

contract OptionalStructStorage {
    data: WithOption;

    init() {
        self.data = WithOption{f: null};
    }
}