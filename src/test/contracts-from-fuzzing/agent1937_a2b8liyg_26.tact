struct StructWithLongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LongStringsInStruct {
    s: StructWithLongStrings;

    init() {
        self.s = StructWithLongStrings{
            s1: "Hello",
            s2: "World",
            s3: "!",
        };
    }
}
