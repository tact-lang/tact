struct NestedStrings {
    s1: String;
    s2: StrStruct;
}

struct StrStruct {
    optStr: String?;
}

contract TestContract {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "foo",
            s2: StrStruct{
                optStr: "bar"
            }
        };
    }
}