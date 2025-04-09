struct StringsAndBools {
    s1: String;
    s2: String?;
    b1: Bool;
    b2: Bool?;
}

contract MixedTypes {
    val: StringsAndBools;

    init() {
        self.val = StringsAndBools{
            s1: "abc",
            s2: null,
            b1: true,
            b2: false
        };
    }
}