struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}