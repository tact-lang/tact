struct StringsAndBools {
    s1: String;
    s2: String;
    s3: String;
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract StringsBoolsTest {
    data: StringsAndBools;
    init() {
        self.data = StringsAndBools{
            s1: "a", s2: "b", s3: "c",
            b1: true, b2: false, b3: true
        };
    }
}
