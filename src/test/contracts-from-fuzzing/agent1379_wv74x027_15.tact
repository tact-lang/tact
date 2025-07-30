struct StringNested {
    s1: String;
    s2: String;
    s3: String;
}

struct WrapStrings {
    inner: StringNested;
}

contract StorageStringStruct {
    data: WrapStrings;

    init() {
        self.data = WrapStrings{
            inner: StringNested{
                s1: "a",
                s2: "b",
                s3: "c",
            },
        };
    }
}
