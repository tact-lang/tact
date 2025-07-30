struct InnerStr {
    s1: String;
    s2: String?;
}

struct OuterStr {
    a: String;
    b: String?;
    c: InnerStr;
}

contract OptionalStrings {
    s: OuterStr;

    init() {
        self.s = OuterStr{
            a:"a",
            b:null,
            c: InnerStr { s1: "s1", s2:null }
        };
    }
}