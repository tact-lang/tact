struct WithString {
    a: String;
    b: String?;
}

contract StringFieldsContract {
    s: WithString;

    init() {
        self.s = WithString{
            a: "Test",
            b: null
        };
    }
}
