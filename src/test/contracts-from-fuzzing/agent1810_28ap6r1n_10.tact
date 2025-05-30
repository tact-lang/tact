struct StringNest {
    a: String;
    b: String?;
    c: String;
}

struct Middle {
    inner: StringNest;
    d: String;
    e: String?;
}

contract StringNestingContract {
    data: Middle;
    init() {
        self.data = Middle{
            inner: StringNest{ a: "a", b: null, c: "c" },
            d: "d",
            e: null
        };
    }
}