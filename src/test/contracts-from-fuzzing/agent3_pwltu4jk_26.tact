// Nested optionals inside struct then used as contract storage
struct InnerWrap {
    i: Int?;
    b: Bool?;
}

struct OuterWrap {
    inner: InnerWrap?;
    str: String?;
}

contract NestedOpts2 {
    d: OuterWrap;

    init() {
        self.d = OuterWrap{
            inner: InnerWrap{
                i:null, b:true
            },
            str: null
        };
    }
}