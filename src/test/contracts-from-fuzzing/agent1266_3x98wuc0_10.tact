struct StringsAndOptionals {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringsMixed {
    testStruct: StringsAndOptionals;

    init() {
        self.testStruct = StringsAndOptionals{
            s1: "one",
            s2: null,
            s3: "three",
            s4: null,
        };
    }
}