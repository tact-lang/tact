struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsInStruct {
    many: NestedStrings;

    init() {
        self.many = NestedStrings{ s1:"a", s2:"b", s3:"c" };
    }
}