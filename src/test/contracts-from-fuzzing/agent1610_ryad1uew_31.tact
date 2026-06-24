struct WithString {
    s: String;
}

contract StringStructField {
    state: WithString;

    init() {
        self.state = WithString{s: "Hello"};
    }
}