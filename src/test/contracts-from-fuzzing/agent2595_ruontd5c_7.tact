struct StringsDeep {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

struct WrapStrings {
    nested: StringsDeep;
    flag: Bool;
}

contract ContractWithStrings {
    content: WrapStrings;

    init() {
        self.content = WrapStrings{
            nested: StringsDeep{
                s1: "111",
                s2: "222",
                s3: "333",
                s4: "444"
            },
            flag: true
        };
    }
}