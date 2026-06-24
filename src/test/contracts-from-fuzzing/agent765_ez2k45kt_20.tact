struct OptionalStr {
    s: String?;
    i: Int;
}

contract TestContract {
    os: OptionalStr;

    init() {
        self.os = OptionalStr{ s: "text", i: 5 };
    }
}