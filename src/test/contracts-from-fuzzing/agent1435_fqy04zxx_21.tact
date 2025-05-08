struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

struct StringsHolder {
    nested: NestedStrings;
    text: String;
}

contract DeepStrings {
    strings: StringsHolder;

    init() {
        self.strings = StringsHolder{
            nested: NestedStrings{
                s1:"a", s2:"b", s3:"c", s4:"d"
            },
            text: "end"
        };
    }
}