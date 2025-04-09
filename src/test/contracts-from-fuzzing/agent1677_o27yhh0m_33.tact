struct WithString {
    s: String;
}

contract AssignStringField {
    f: WithString;

    init() {
        self.f = WithString{ s: "abc" };
    }
}