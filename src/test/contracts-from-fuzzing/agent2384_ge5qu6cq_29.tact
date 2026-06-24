struct WithString {
    message: String;
}

contract StringInStruct {
    s: WithString;

    init() {
        self.s = WithString{message: "hello!"};
    }
}