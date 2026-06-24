struct StringsAndNulls {
    s1: String;
    s2: String?;
    s3: String?;
}

contract StringNullFields {
    k: StringsAndNulls;

    init() {
        self.k = StringsAndNulls{
            s1: "aaa",
            s2: null,
            s3: null,
        };
    }
}