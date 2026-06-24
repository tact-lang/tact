struct StringNested {
    s1: String;
    s2: String;
    s3: String;
}

contract StringInStruct {
    nest: StringNested;

    init() {
        self.nest = StringNested{
            s1: "abc",
            s2: "def",
            s3: "ghi"
        };
    }
}