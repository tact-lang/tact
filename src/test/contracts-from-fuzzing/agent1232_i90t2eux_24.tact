struct SWithStrings {
    s1: String;
    s2: String?;
}

contract StringsOptional {
    s: SWithStrings;

    init() {
        self.s = SWithStrings{
            s1: "present",
            s2: null,
        };
    }
}