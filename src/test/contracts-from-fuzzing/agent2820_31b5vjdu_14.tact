struct StringsOpt {
    s1: String;
    s2: String?;
}

contract StringOptionals {
    data: StringsOpt;

    init() {
        self.data = StringsOpt{
            s1: "hello",
            s2: null
        };
    }
}