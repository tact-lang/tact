struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiStringFields {
    vals: StringStruct;

    init() {
        self.vals = StringStruct{ s1: "one", s2: "two", s3: "three" };
    }
}