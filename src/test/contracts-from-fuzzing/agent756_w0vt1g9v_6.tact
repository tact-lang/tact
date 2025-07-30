struct StringsAndInts {
    s1: String;
    s2: String;
    s3: String;
    i1: Int;
    i2: Int;
    i3: Int;
}

contract MixedStringsInts {
    field: StringsAndInts;
    init() {
        self.field = StringsAndInts{
            s1: "one",
            s2: "two",
            s3: "three",
            i1: 1,
            i2: 2,
            i3: 3,
        };
    }
}