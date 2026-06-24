struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StorageStrings {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four"
        };
    }
}