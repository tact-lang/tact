struct WithStringField {
    s: String;
}

contract StringStorage {
    val: WithStringField;

    init() {
        self.val = WithStringField{ s: "hello" };
    }

    receive() {
        self.val = WithStringField{ s: "world" };
    }
}