struct ManyNestedOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: InnerWrap?;
}

struct InnerWrap {
    x: Int?;
    y: Bool?;
}

contract HeavyOptionGame {
    val: ManyNestedOpts;

    init() {
        self.val = ManyNestedOpts{ a:null, b:null, c:null, d:null };
    }
}