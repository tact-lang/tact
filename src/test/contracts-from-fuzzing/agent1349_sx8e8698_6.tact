struct StructWithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsInStruct {
    data: StructWithStrings;

    init() {
        self.data = StructWithStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}