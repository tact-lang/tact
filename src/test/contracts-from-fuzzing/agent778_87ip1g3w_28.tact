struct WithString {
    s: String;
    n: Int;
}

contract StringInStruct {
    data: WithString;
    init() {
        self.data = WithString{ s: "Hello", n: 42 };
    }
}