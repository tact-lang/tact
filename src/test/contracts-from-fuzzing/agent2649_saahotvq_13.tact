struct StrNest {
    s: String;
    inner: InnerStr;
}

struct InnerStr {
    s2: String;
}

contract StringNested {
    val: StrNest;

    init() {
        self.val = StrNest{
            s: "outer",
            inner: InnerStr{
                s2: "inner"
            }
        };
    }
}