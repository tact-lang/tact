struct WithString {
    message: String;
    amount: Int;
}

contract StringPersist {
    data: WithString;

    init() {
        self.data = WithString{
            message: "Test string",
            amount: 42
        };
    }
}