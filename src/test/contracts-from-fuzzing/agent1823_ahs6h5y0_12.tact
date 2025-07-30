struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsStorage {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "hello",
            s2: "world",
            s3: "ton"
        };
    }
}