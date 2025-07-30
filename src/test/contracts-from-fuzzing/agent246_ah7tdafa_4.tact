struct StringsAndBools {
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
    optS1: String?;
    optS2: String?;
    optB1: Bool?;
}

contract MixedTypes {
    val: StringsAndBools;
    init() {
        self.val = StringsAndBools{
            s1: "one",
            s2: "two",
            b1: true,
            b2: false,
            optS1: null,
            optS2: null,
            optB1: null
        };
    }
}