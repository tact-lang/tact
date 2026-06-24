struct StringsStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsStructField {
    strct: StringsStruct;

    init() {
        self.strct = StringsStruct{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}
