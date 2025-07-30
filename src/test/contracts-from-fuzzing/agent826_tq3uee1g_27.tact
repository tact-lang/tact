struct WithString {
    text: String;
}

struct WithBool {
    flag: Bool;
}

contract StringBoolNested {
    s: WithString;
    b: WithBool;
    init() {
        self.s = WithString{text: "abc"};
        self.b = WithBool{flag: true};
    }
}