struct First {
    val: Int;
}

struct Second {
    nested: First;
    opt: Int?;
    flag: Bool;
}

contract TwoLevel {
    state: Second;

    init() {
        self.state = Second{
            nested: First{ val: 42 },
            opt: null,
            flag: true,
        };
    }
}