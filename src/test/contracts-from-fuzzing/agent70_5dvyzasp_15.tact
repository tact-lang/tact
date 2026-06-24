struct NestedStrings {
    s: String;
    deeper: Deeper;
}

struct Deeper {
    inner: String;
    inOpt: String?;
}

contract Contract {
    st: NestedStrings;

    init() {
        self.st = NestedStrings{
            s: "hi",
            deeper: Deeper{
                inner: "there",
                inOpt: null 
            }
        };
    }
}