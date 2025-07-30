struct WithString {
    s: String;
    n: Int;
}

contract TestContract {
    data: WithString;

    init() {
        self.data = WithString{
            s: "hello",
            n: 42
        };
    }
}