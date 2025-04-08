struct StringNest {
    s: String;
    child: InnerStr;
}

struct InnerStr {
    inner: String?;
}

contract NestedStrings {
    data: StringNest;

    init() {
        self.data = StringNest{
            s: "outer",
            child: InnerStr{
                inner: "inner"
            }
        };
    }
}
