struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsPersist {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}