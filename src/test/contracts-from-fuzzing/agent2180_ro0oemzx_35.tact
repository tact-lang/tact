struct WithBool {
    flag: Bool;
}

contract OnlyBool {
    content: WithBool;

    init() {
        self.content = WithBool{ flag: false };
    }
}