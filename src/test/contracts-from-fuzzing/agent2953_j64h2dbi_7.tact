struct StringStruct {
    s1: String;
    s2: String?;
    s3: String;
}

contract StringStructContract {
    field: StringStruct;

    init() {
        self.field = StringStruct{
            s1: "hello",
            s2: null,
            s3: "world",
        };
    }
}