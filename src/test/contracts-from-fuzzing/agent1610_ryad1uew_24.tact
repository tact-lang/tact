struct BoolAndStrings {
    flag: Bool;
    text: String;
    flag2: Bool;
    text2: String;
}

contract TestBoolString {
    val: BoolAndStrings;

    init() {
        self.val = BoolAndStrings{
            flag: true,
            text: "abc",
            flag2: false,
            text2: "def"
        };
    }
}