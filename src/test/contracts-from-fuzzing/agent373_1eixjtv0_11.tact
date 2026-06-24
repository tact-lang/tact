struct WithString {
    message: String;
}

contract StringDefault {
    s: WithString;

    init() {
        self.s = WithString{ message: "" };
    }
}