struct TwoStrings {
    a: String;
    b: String;
}

contract TestContract {
    s: TwoStrings;
    init() {
        self.s = TwoStrings{ a: "foo", b: "bar" };
    }
}