struct StringBool {
    s: String;
    b: Bool;
}

contract TestContract {
    f: StringBool;

    init() {
        self.f = StringBool{
            s: "abc",
            b: true
        };
    }
}