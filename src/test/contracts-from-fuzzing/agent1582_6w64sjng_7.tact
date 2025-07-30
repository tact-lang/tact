struct StringsOptional {
    s1: String;
    s2: String?;
    s3: String;
}

contract StringsOptionalContract {
    data: StringsOptional;
    init() {
        self.data = StringsOptional{ s1: "a", s2: null, s3: "b" };
    }
}