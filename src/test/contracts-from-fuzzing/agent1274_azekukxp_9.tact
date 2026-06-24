struct WithBool {
    flag: Bool;
    count: Int;
}

contract BoolFieldContract {
    data: WithBool;

    init() {
        self.data = WithBool{ flag: true, count: 42 };
    }
}