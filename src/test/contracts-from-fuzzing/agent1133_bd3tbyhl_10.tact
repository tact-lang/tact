struct NestedString {
    s1: String;
    s2: String?;
}

struct ComposeStrings {
    a: NestedString;
    b: NestedString;
    big: String;
    opt: String?;
}

contract StringStorage {
    store: ComposeStrings;

    init() {
        self.store = ComposeStrings{
            a: NestedString{s1:"one", s2:null},
            b: NestedString{s1:"two", s2:"three"},
            big: "hello",
            opt: null
        };
    }
}