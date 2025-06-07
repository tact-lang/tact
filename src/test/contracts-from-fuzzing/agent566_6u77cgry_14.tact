struct Inner {
    p: Int;
    q: Bool?;
    r: String;
}

struct Middle {
    m: Inner;
    n: Inner?;
}

contract NestedOptionalAndNormal {
    data: Middle;

    init() {
        self.data = Middle{
            m: Inner{ p:1, q:null, r:"x" },
            n: null
        };
    }
}