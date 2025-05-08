struct S {
    num: Int;
    optBool: Bool?;
    text: String;
}

contract OptDefaults {
    state: S;

    init() {
        self.state = S{
            num: 42,
            optBool: null,
            text: "hi"
        };
    }
}