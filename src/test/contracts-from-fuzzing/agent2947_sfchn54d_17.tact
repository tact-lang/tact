struct BigStrings {
    str1: String;
    str2: String;
    str3: String;
    str4: String;
    str5: String;
}

contract StringsMany {
    param: BigStrings;

    init() {
        self.param = BigStrings {
            str1: "One",
            str2: "Two",
            str3: "Three",
            str4: "Four",
            str5: "Five"
        };
    }
}