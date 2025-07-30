struct InnerS {
    a: Int;
}

struct OuterWrap {
    s: InnerS?;
}

contract Test42 {
    val: OuterWrap;
    init() {
        self.val = OuterWrap{s:null};
    }
}