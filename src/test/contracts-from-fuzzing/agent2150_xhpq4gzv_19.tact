struct CrazyStrings {
    s1: String = "hello";
    s2: String? = null;
    s3: String = "world";
    s4: String? = null;
}

struct TopWrap {
    nested: CrazyStrings;
    plainStr: String?;
}

contract TestContract {
    f: TopWrap;
    init() {
        self.f = TopWrap{
            nested: CrazyStrings{},
            plainStr: null
        };
    }
}