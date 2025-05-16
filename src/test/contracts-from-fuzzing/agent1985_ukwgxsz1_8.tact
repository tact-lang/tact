struct StringsNested {
    s1: String;
    s2: String;
}

struct StringsHolder {
    nested: StringsNested;
    s3: String;
}

contract NestedStrings {
    data: StringsHolder;

    init() {
        self.data = StringsHolder{
            nested: StringsNested{ s1: "one", s2: "two" },
            s3: "three",
        };
    }
}
