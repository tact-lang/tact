struct InnerStr {
    s: String;
}

struct OuterStr {
    ins: InnerStr;
    num: Int;
}

contract StrNest {
    sfield: OuterStr;

    init() {
        self.sfield = OuterStr{
            ins: InnerStr{s: "abc"},
            num: 9
        };
    }
}