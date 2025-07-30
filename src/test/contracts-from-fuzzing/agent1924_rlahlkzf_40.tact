struct StringAndBool {
    a: String;
    b: Bool;
}

contract TestContract {
    s: StringAndBool;

    init() {
        self.s = StringAndBool{
            a: "example",
            b: true
        };
    }
}