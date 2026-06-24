struct StringsHaveNull {
    s1: String?;
    s2: String;
    s3: String?;
}

contract StringsContract {
    strStruct: StringsHaveNull;

    init() {
        self.strStruct = StringsHaveNull{
            s1: null,
            s2: "hi",
            s3: null
        };
    }
}