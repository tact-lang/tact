struct OptionalString {
    s1: String?;
    s2: String?;
}

contract NullStrings {
    opt: OptionalString;

    init() {
        self.opt = OptionalString{
            s1: null,
            s2: "yo"
        };
    }
}