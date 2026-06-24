struct HasString {
    s: String;
}

contract StrField {
    f: HasString;

    init() {
        self.f = HasString{ s: "test" };
    }
}