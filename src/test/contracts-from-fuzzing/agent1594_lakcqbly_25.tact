struct LargeDeep {
    a: Int;
    b: InnerDeep;
}

struct InnerDeep {
    c: Bool;
    d: InnerMost;
}

struct InnerMost {
    e: String;
    f: Int;
}

contract NestedMany {
    data: LargeDeep;
    init() {
        self.data = LargeDeep{
            a:1,
            b: InnerDeep{
                c:true,
                d: InnerMost{ e:"hi", f:7 }
            }
        };
    }
}