struct StringStruct {
    data: String;
}

contract ManyStrings {
    s1: StringStruct;
    s2: StringStruct;
    s3: StringStruct;

    init() {
        self.s1 = StringStruct{ data: "one" };
        self.s2 = StringStruct{ data: "two" };
        self.s3 = StringStruct{ data: "three" };
    }
}