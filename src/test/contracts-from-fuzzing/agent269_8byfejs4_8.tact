struct NestedWithStrings {
    s1: String;
    s2: String?;
    flag: Bool;
}

contract StringStruct {
    strData: NestedWithStrings;

    init() {
        self.strData = NestedWithStrings{
            s1: "Hello",
            s2: "World",
            flag: true
        };
    }
}