struct ABool {
    value: Bool;
}

struct OnTop {
    ab: ABool;
    flag: Bool;
}

contract BoolStruct {
    state: OnTop;

    init() {
        self.state = OnTop{
            ab: ABool{value: true},
            flag: false,
        };
    }
}
