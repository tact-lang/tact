struct StringsAndInts {
    s1: String;
    s2: String;
    num1: Int;
    flag: Bool;
}

contract MixedFields {
    data: StringsAndInts;

    init() {
        self.data = StringsAndInts{
            s1: "abc",
            s2: "def",
            num1: 42,
            flag: true
        };
    }
}
