struct WithStringDefaults {
    a: String = "a";
    b: String = "b";
    c: String = "c";
}

contract DefaultStrings {
    s: WithStringDefaults;

    init() {
        self.s = WithStringDefaults{ a: "x", b: "y", c: "z" };
    }
}