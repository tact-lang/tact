struct SString {
    text: String;
    optText: String?;
}

contract TestContract {
    s: SString;
    init() {
        self.s = SString{text: "hello", optText: null};
    }
}