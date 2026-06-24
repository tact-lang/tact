struct StringOptional {
    s1: String;
    s2: String?;
}

contract StringOptVars {
    st: StringOptional;

    init() {
        self.st = StringOptional {
            s1: "abc",
            s2: null
        };
    }
}