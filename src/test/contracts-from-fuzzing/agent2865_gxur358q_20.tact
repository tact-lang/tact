struct ContainedString {
    text: String;
}

contract OptionalStructWithString {
    payload: ContainedString?;

    init() {
        self.payload = ContainedString{ text: "hi" };
    }
}