struct HasStrings {
    str1: String;
    str2: String;
    str3: String?;
}

contract TestStrings {
    val: HasStrings;

    init() {
        self.val = HasStrings{
            str1: "a",
            str2: "b",
            str3: null
        };
    }
}