struct StringNest {
    a: String;
    b: String?;
}

struct Wrapper {
    inner1: StringNest;
    inner2: StringNest;
}

contract MultiString {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            inner1: StringNest{a:"hi", b:null},
            inner2: StringNest{a:"bye", b:"x"}
        };
    }
}