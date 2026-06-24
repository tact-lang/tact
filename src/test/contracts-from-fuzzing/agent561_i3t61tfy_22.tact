struct NestedStrings {
    s1: String;
    s2: String?;
}

struct HasNestedStrings {
    x: Int;
    ns: NestedStrings;
    flag: Bool;
}

contract StringNestContract {
    data: HasNestedStrings;

    init() {
        self.data = HasNestedStrings{
            x: 42,
            ns: NestedStrings{s1:"abc", s2:null},
            flag: true
        };
    }
}