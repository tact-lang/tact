// test with alternation optionals inside nested structs
struct InnerAlternating {
    a: Int?;
    b: Bool;
    c: Int?;
    d: Bool;
}

struct WrapAlternate {
    inner: InnerAlternating?;
}

contract AlternateOptionalPattern {
    data: WrapAlternate = WrapAlternate{
        inner: null
    };

    init() {
        self.data = WrapAlternate{
            inner: InnerAlternating{
                a:1,
                b:true,
                c:null,
                d:false
            }
        };
    }
}