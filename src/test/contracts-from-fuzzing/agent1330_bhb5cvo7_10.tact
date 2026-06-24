struct NestedStrings {
    inner1: String;
    inner2: InnerS;
}

struct InnerS {
    s: String;
    opt: String?;
}

contract NSContract {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            inner1: "hi",
            inner2: InnerS{ s: "hello", opt: null }
        };
    }
}