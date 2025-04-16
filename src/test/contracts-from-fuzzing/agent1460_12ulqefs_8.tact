struct WithStrings {
    a: String;
    b: String;
}

contract TestContract {
    data: WithStrings;

    init() {
        self.data = WithStrings{ a: "hello", b: "world" };
    }
}