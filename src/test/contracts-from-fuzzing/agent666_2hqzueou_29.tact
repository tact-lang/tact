struct WithString {
    s: String = "abc";
}

contract SingleDefaultString {
    f: WithString;

    init() {
        self.f = WithString{};
    }
}