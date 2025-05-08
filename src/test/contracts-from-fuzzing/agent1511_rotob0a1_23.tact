struct MessageHolder {
    s: String;
}

contract FieldAssignment {
    value: MessageHolder;

    init() {
        let temp = MessageHolder{ s: "hello" };
        self.value = temp;
    }
}
