struct EmptyStringsOpt {
    s1: String;
    s2: String?;
}

contract EdgeStrings {
    data: EmptyStringsOpt;

    init() {
        self.data = EmptyStringsOpt{
            s1: "",
            s2: null
        };
    }
}