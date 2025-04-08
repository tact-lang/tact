struct InnerMost {
    b: Bool;
}

struct Mid {
    s: String;
    inner: InnerMost;
}

struct OuterWrap {
    v: Int;
    mid: Mid;
}

contract NestedMultiType {
    val: OuterWrap;
    init() {
        self.val = OuterWrap{
            v:1,
            mid: Mid{s:"hello", inner: InnerMost{b:true}}
        };
    }
}