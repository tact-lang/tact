struct StringStruct {
    s1: String;
    s2: String?;
    s3: String;
}

contract PersistentStrings {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "alpha",
            s2: null,
            s3: "omega"
        };
    }
}
