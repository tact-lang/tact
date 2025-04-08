struct NestedStrings {
    str1: String;
    str2: String?;
    str3: String;
    str4: String?;
}

contract ComplexStrings {
    data: NestedStrings = NestedStrings{
        str1: "one",
        str2: null,
        str3: "three",
        str4: null,
    };
    init() {
        self.data = NestedStrings{
            str1: "1",
            str2: "2",
            str3: "3",
            str4: "4",
        };
    }
}
