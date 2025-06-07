struct StringsAndBools {
    first: String;
    second: String?;
    flag1: Bool;
    flag2: Bool?;
}

contract MixedStringBool {
    val: StringsAndBools;

    init() {
        self.val = StringsAndBools{
            first: "foo",
            second: null,
            flag1: true,
            flag2: false
        };
    }
}