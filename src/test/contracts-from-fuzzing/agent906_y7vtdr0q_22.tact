struct StringStruct {
    s1: String;
    s2: String?;
    s3: String;
}

contract StringsInState {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "a",
            s2: null,
            s3: "b",
        };
    }
}