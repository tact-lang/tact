struct ContainsStrings {
    s1: String;
    s2: String?;
}

contract StringsInStruct {
    content: ContainsStrings;

    init() {
        self.content = ContainsStrings{ s1:"abc", s2:null };
    }
}