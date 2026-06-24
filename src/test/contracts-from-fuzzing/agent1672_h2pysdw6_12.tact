struct WithString {
    s: String;
}

contract StringInStruct {
    f: WithString;

    init() {
        self.f = WithString{ s: "hello" };
    }
}
