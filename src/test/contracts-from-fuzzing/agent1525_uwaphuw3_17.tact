struct StringStruct {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringFields {
    val: StringStruct;

    init() {
        self.val = StringStruct{
            s1: "alpha",
            s2: null,
            s3: "beta",
            s4: "gamma",
        };
    }
}