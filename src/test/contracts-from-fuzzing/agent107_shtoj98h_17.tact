struct WithString {
    message: String;
    note: String?;
}

contract TestContract {
    val: WithString;

    init() {
        self.val = WithString{
            message: "Hello",
            note: null
        };
    }
}
