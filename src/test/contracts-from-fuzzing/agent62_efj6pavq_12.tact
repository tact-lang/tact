struct StringsOnly {
    s1: String;
    s2: String;
}

contract StringFields {
    ss: StringsOnly;

    init() {
        self.ss = StringsOnly{
            s1: "Hello",
            s2: "World"
        };
    }
}